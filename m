Return-Path: <linux-renesas-soc+bounces-11176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C29EB7FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21AFC281783
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B957223978D;
	Tue, 10 Dec 2024 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z8aS1rFk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8AC238745
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850618; cv=none; b=EFSNZLyx6r9ZPKhueI8pX7tRYQt+EFd+/rFI6vQ/aYalmzX/Qd0uo+1CDMWJgJ5ZG3v9+AgHpekDAZiLvFuT42PcZuXUUU/7jreOC1Bt24OWCgCKZLtffL0u+pgHpd/h/6isgTSjCp2K9dccujtWoUqtlYAKRw8MibV5VpME6Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850618; c=relaxed/simple;
	bh=o6bb+5TT8a4+4885SQUIo5IIlBm8LtwjyGEaLw06x18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NJbU5ec1nxL4yFj4XoFd/6F/WwDFOJ8ePmqZf/qjHqmrNl80RgryL8d5H+V48WCUjXuNCXNexAm/pCx1hDcPH2+z4l53/hNMkTxCl7IWK63NALG8kfe7OKYvIaMcYzsk0sHMDip3bbpT/A6Fd6R3cJmuno3A2KI8sMa33xSwiTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z8aS1rFk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso3087808a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850615; x=1734455415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qo27pKYlk9UKLBg0czdTh7Uwm7olEalHUIHQAM8AonU=;
        b=Z8aS1rFkPFcW6HVvHWEvY3y1gaA/3L8R4Y98KSpWWewm5TtWDlhTKpXZpV3K77P/4c
         N2wqVl0vJ+oPaKCY7GdIUhj2aYeo1oHpZUecZOGzAbaXLIPtnCXOA1EemDfWm9c1ZLgg
         M9CWLqbsW9uJUOhykjAVP29IClLpmLF3aXFYIU+cBFiVbAgrdaAQlOVr3ftX5biZBNUt
         2sS8bKUzq82r2zT1gvyFXzlbxxVQOoDpk3w7JpbWHTcCly5WGb95yy/qyUn3Vuv/wSk2
         ynDhUmd2NGKP26b9mYYJVxMuBXjw3RmbDNx1jnUnI60IJKxnVG6vqJS82eTB6It62ydr
         mK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850615; x=1734455415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qo27pKYlk9UKLBg0czdTh7Uwm7olEalHUIHQAM8AonU=;
        b=kwqOxpf3qLjjOiagFhpuaheOS97hyV9awbsav2gFgyIOgrMIf4IQTB032Zl5eGASyO
         xAR71HPQvrPopJ9dsIO8T5ashlIrlnVfkqVMKcoTcrhVnsgnu0CJX1kZYKZ4bXTj+88/
         WNNb5YW76I7a5W3RKXq4IYF+nSk4FOufZRJ1m+0gxC0mERJ0jn7vTl2hqI2MtcvimZZe
         P8zoKLMM/f0VRS8wE7fhCvurCCZLTgJpMS9kcdwk56UrYqCGhpVJ1rt946MQQIIRCrxq
         5bQFScf+biHlpCgRzabiJ4yuQBxCHBYVGKk0HBs7cAuJEGI3jhXnAZJWolaSAm4YrfeX
         4Njg==
X-Forwarded-Encrypted: i=1; AJvYcCWuE+oCkrEHP9RFOlN2xm1CBBlCMhDUPZ10PiuCYb8nzb8NMQnv8/T+WhYX1dQw/zQBnRgpcV54cEyKL5yvJA2L7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuGYzPF4puJsPneqEtvHuSxGbXg2jpf1i0GbSLOqmVn1pcb/Zf
	EAxi/3w6SNG2/E5jjF/pfDS6kBCwuAdFLj3/58Sbkho6q6P6vVlkLURzh2o94ag=
X-Gm-Gg: ASbGnctN/Oy4V21F74whwZ0ea4KtsHiBYpyg3ZtlHl4PS7PvGWVEi9qkuW2JQBiqKWX
	OGfvJ6rXJtk/Cr81qSiZYmEtBGN3BucygvOTd3QgrjXDs/qBpVBTEGAOWv5gxfUkWKtzqUD0ArI
	K7mO+3NiNac9HO+9O07Lq6hiA3dTt/5eDnKQE8z90shP0Rjgr32yUYkJKbfp59Ukk8XLBSyvop3
	WAuqQ8z///DrSvYFQ+08FWCEdoEQe29F7cT6T1YPcywm5KlFo7+rja12dkpFvNjgCi9WZY0f+yJ
	wfA51CnP
X-Google-Smtp-Source: AGHT+IGWUjWO6EYZ1uAazblGzPDgU2K3A7r87jOiz1TUWyFTmpyxPZFuPXfCgEn67jBfzXe1r6LxEw==
X-Received: by 2002:a05:6402:11d1:b0:5d1:f009:9266 with SMTP id 4fb4d7f45d1cf-5d3be65f80bmr15150003a12.2.1733850614698;
        Tue, 10 Dec 2024 09:10:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:14 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 04/24] ASoC: renesas: rz-ssi: Terminate all the DMA transactions
Date: Tue, 10 Dec 2024 19:09:33 +0200
Message-Id: <20241210170953.2936724-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The stop trigger invokes rz_ssi_stop() and rz_ssi_stream_quit().
- The purpose of rz_ssi_stop() is to disable TX/RX, terminate DMA
  transactions, and set the controller to idle.
- The purpose of rz_ssi_stream_quit() is to reset the substream-specific
  software data by setting strm->running and strm->substream appropriately.

The function rz_ssi_is_stream_running() checks if both strm->substream and
strm->running are valid and returns true if so. Its implementation is as
follows:

static inline bool rz_ssi_is_stream_running(struct rz_ssi_stream *strm)
{
    return strm->substream && strm->running;
}

When the controller is configured in full-duplex mode (with both playback
and capture active), the rz_ssi_stop() function does not modify the
controller settings when called for the first substream in the full-duplex
setup. Instead, it simply sets strm->running = 0 and returns if the
companion substream is still running. The following code illustrates this:

static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
{
    strm->running = 0;

    if (rz_ssi_is_stream_running(&ssi->playback) ||
        rz_ssi_is_stream_running(&ssi->capture))
        return 0;

    // ...
}

The controller settings, along with the DMA termination (for the last
stopped substream), are only applied when the last substream in the
full-duplex setup is stopped.

While applying the controller settings only when the last substream stops
is not problematic, terminating the DMA operations for only one substream
causes failures when starting and stopping full-duplex operations multiple
times in a loop.

To address this issue, call dmaengine_terminate_async() for both substreams
involved in the full-duplex setup when the last substream in the setup is
stopped.

Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
Cc: stable@vger.kernel.org
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- updated patch description

Changes in v3:
- collected tags
- use proper fixes commit SHA1 and description
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 6efd017aaa7f..2d8721156099 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -415,8 +415,12 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
 
 	/* Cancel all remaining DMA transactions */
-	if (rz_ssi_is_dma_enabled(ssi))
-		dmaengine_terminate_async(strm->dma_ch);
+	if (rz_ssi_is_dma_enabled(ssi)) {
+		if (ssi->playback.dma_ch)
+			dmaengine_terminate_async(ssi->playback.dma_ch);
+		if (ssi->capture.dma_ch)
+			dmaengine_terminate_async(ssi->capture.dma_ch);
+	}
 
 	rz_ssi_set_idle(ssi);
 
-- 
2.39.2


