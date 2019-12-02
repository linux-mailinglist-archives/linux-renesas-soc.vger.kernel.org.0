Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7286610ECB9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 16:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfLBP6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 10:58:40 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:39980 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbfLBP6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 10:58:39 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id Z3yb2100f5USYZQ063ycAD; Mon, 02 Dec 2019 16:58:38 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ibo5r-0007jA-Rm; Mon, 02 Dec 2019 16:58:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ibo5r-0005sx-Oc; Mon, 02 Dec 2019 16:58:35 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: rsnd: Calculate DALIGN inversion at run-time
Date:   Mon,  2 Dec 2019 16:58:34 +0100
Message-Id: <20191202155834.22582-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no need to store the inverted DALIGN values in the table, as
they can easily be calculated at run-time.  This also protects against
the introduction of inconsistencies between normal and inverted values
by a future table modification.

Reorder the two subexpressions in the AND check, to perform the least
expensive check first.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

Interestingly, this decreases code size on arm64, but increases on arm32
(both gcc version 7.4.0 (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1)).

arm32:

       text	   data	    bss	    dec	    hex	filename
      16186	    276	     84	  16546	   40a2	sound/soc/sh/rcar/core.o.orig
      16194	    276	     84	  16554	   40aa	sound/soc/sh/rcar/core.o

arm64:

       text	   data	    bss	    dec	    hex	filename
      17426	    392	    104	  17922	   4602	sound/soc/sh/rcar/core.o.orig
      17414	    392	    104	  17910	   45f6	sound/soc/sh/rcar/core.o
---
 sound/soc/sh/rcar/core.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 399dc6e9bde5b042..d20f03dfdee66643 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -376,20 +376,15 @@ u32 rsnd_get_adinr_bit(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
  */
 u32 rsnd_get_dalign(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
 {
-	static const u32 dalign_values[8][2] = {
-		{0x76543210, 0x67452301},
-		{0x00000032, 0x00000023},
-		{0x00007654, 0x00006745},
-		{0x00000076, 0x00000067},
-		{0xfedcba98, 0xefcdab89},
-		{0x000000ba, 0x000000ab},
-		{0x0000fedc, 0x0000efcd},
-		{0x000000fe, 0x000000ef},
+	static const u32 dalign_values[8] = {
+		0x76543210, 0x00000032, 0x00007654, 0x00000076,
+		0xfedcba98, 0x000000ba, 0x0000fedc, 0x000000fe,
 	};
-	int id = 0, inv;
+	int id = 0;
 	struct rsnd_mod *ssiu = rsnd_io_to_mod_ssiu(io);
 	struct rsnd_mod *target;
 	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
+	u32 dalign;
 
 	/*
 	 * *Hardware* L/R and *Software* L/R are inverted for 16bit data.
@@ -425,15 +420,15 @@ u32 rsnd_get_dalign(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
 	if (mod == ssiu)
 		id = rsnd_mod_id_sub(mod);
 
-	/* Non target mod or non 16bit needs normal DALIGN */
-	if ((snd_pcm_format_width(runtime->format) != 16) ||
-	    (mod != target))
-		inv = 0;
-	/* Target mod needs inverted DALIGN when 16bit */
-	else
-		inv = 1;
+	dalign = dalign_values[id];
+
+	if (mod == target && snd_pcm_format_width(runtime->format) == 16) {
+		/* Target mod needs inverted DALIGN when 16bit */
+		dalign = (dalign & 0xf0f0f0f0) >> 4 |
+			 (dalign & 0x0f0f0f0f) << 4;
+	}
 
-	return dalign_values[id][inv];
+	return dalign;
 }
 
 u32 rsnd_get_busif_shift(struct rsnd_dai_stream *io, struct rsnd_mod *mod)
-- 
2.17.1

