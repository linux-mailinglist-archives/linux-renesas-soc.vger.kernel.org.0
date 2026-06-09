Return-Path: <linux-renesas-soc+bounces-33728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SbA8KlVuJ2pQwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:37:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C865BADD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:37:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h14k+c1M;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3725C30D828B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15714345CCA;
	Tue,  9 Jun 2026 01:32:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7163403FE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:32:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968741; cv=none; b=OTfN+QWSvdSyJ/SqQU9FPFYTxzTYHZ3Dtp7QzR0dw1PQfn8QDymnamb2lMfzEqHExzIUXL0LTB0QbGg/4OYQj6C3zld9GizBjR5LEWCR2bZa1+7AxcYQYewyvjcRSs2SvQLUJZvXJUjGIiKbfp5/FJv/FEH5T0JEkQzn/KX4sAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968741; c=relaxed/simple;
	bh=smVRpaCZIxDLyRWoZHXLUYpzGx3iLGVagavXEXO2aXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1bM8PH3LMhVj+yt4YIH2vMk3ia1P8PT859FVKhgDlRApQLYEUoe/amlR0w6nAvSNTozZa+ghSWUfMe2KoOFXZSg7lOI6Bbhkjs/H5lN3FVeCILumuuOkTZriic2tCILpH/utvdMKeTYlVQUIdGk+VL1kmvtIFL6QKpmfcdg8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h14k+c1M; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2a68d01so33791595ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968739; x=1781573539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLvmQCFNohOOsJ3JAW+RyfCTOssyDUr0gIAh//bmteA=;
        b=h14k+c1MXvAZ2WZRWrtBlPOCRWwIr7PO1nVu94qUAd2CTEwzRESG0Frh2RUnZNFxvL
         mCCv92hUsWypy1l9prDfunSdE4e7L59Rg6nIhMSaGbzgSwykOlQnYvrYh9u8m4dy06HE
         9Ovk0eTfhBXGwgO0ROtejUMfcJEwqdog8JDG60ZvvtyTyt0b/Qk8R6KJioMOmACLfSXu
         NdEAoFej5RREXiOzJpwepGouAoi3ibCpqFSYRGeXGymmuQJQ95XDcn+1u3CDkOoFlnQb
         Rgad/DQ6bndY/6rpA9xELsGAunkjd0zcCkflzdjgJJNGD64ualDh0+n7OO3DkbTSJ7xj
         V0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968739; x=1781573539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLvmQCFNohOOsJ3JAW+RyfCTOssyDUr0gIAh//bmteA=;
        b=QfccIBnfVNZr0vnl1N2wz35rp9YXkk8Ih2aRV4cSSxjpQcgLwgrxNC4SvTLtd3xEKL
         P2jWVISzw+HRtUEFFPG4SJdKP3hW32W/pylesrssArXTAptW2+uWLIfzMVcti7u0XH05
         k8bnXKrbr2YdARmRlXmMbwjIdtldOpYzEYSLmlmaf/D6qVgNKfUFthZEZGLg6jSzOXPG
         gKuVIn9SLbik2OJOsaa1k4WPO5ISgjKoZ8OMuqNP//RBbifeDXqQRB6XHoIIydnhgqUW
         wPzT2crcNhRI3OUwbAqBD+lsuskumnwf6a4Ta5g4qN16+51k/Q2SsXqLfLa8yZ4P7bVL
         Z+iw==
X-Forwarded-Encrypted: i=1; AFNElJ9hICvE2hEiE3SQoHED1dO9q2YD1jq/HFSDtvygxx4Pz9x7Rrxdt4witFHFy58zcPaFU3wGZm047M0c5x/oVbjeVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9mPAe6WFPI5D0tl9dfQpoopPuhy+tAxPsrPo259fb/Y3dku6
	CagttI5iNVtunAu1smqOzhbX0ejw8+ucOrTQn3WZcCefGw+DoHTgeg6y
X-Gm-Gg: Acq92OGiR0gGU0l5wqnYg05XvMFzCPeP/wRYaFcpKDWj0b3YEOTWciGPEgzlbUHMYIJ
	Bfto++5yKNr9Bez9zU9lSSALmlYFy8/2oUREW3kHRvdCb/N0v96ASRAkHutedODSU/vxZ0BftQO
	Jj/wKf0OvDguedxyu33io+NVPX8VsKvfXUygkXccWVj7An9ZGt42aOUU+Y7+ETP/lPXZ+2eR7iV
	UEZS9k91ZIDCW+QthE5svWTRsGzBivHD4s2PuCb8YJNpA/ccbMO7Em4hxz8Tcpx/Aak+aSF3+fU
	8OKV0utfjiTFN1V2AwRsn659FwIXmqYJ2hk4w6n4kQDkCLwElu0fq37Kn0Yh3IetlkyhICxTC/b
	dqc3NDeJmMe/t98lMa47IKBENMh4LEXjtkHJkE3GNWQ43Xs2ZT1YE4xPRrfx9F5eI7ZlOsQUZ1e
	X62wjcsFCe6sbipXRNDC9LiNldsDvwN00I/anT4mI+sLFB6TO/+DSaHQ4C9670KNTAvSfQN9XAs
	Tb6ErE=
X-Received: by 2002:a17:902:ced1:b0:2c0:fa4e:91f6 with SMTP id d9443c01a7336-2c1e7d41eabmr194574365ad.13.1780968738667;
        Mon, 08 Jun 2026 18:32:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:32:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
Date: Tue,  9 Jun 2026 08:31:07 +0700
Message-ID: <20260609013107.5995-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33728-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 134C865BADD

From: bui duc phuc <phucduc.bui@gmail.com>

Enable and disable the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the
driver accesses hardware registers.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v5:
 - Drop spu_count and rely on the clk core for clock reference
   counting.

 sound/soc/renesas/fsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 80e87b815c1b..a1c463d73756 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1560,6 +1560,11 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret;
+	/* enable spu bus bridge clock */
+	ret = clk_enable(fsi->master->clk_spu);
+	if (ret < 0)
+		return ret;
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1617,6 +1622,8 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	/* stop spu bus bridge clock */
+	clk_disable(fsi->master->clk_spu);
 
 	return 0;
 }
-- 
2.43.0


