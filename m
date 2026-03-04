Return-Path: <linux-renesas-soc+bounces-28743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOpKGTvdp2lnkgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:20:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BC91FB86D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D416C302D978
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 07:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A215352C2B;
	Wed,  4 Mar 2026 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rpo62eeJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276BC34D385
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608805; cv=none; b=kCEbYPTzJsBY2fKSFtRK3oDvYybKI3nhENcU3DYFyc7zGejRsN6xLjKB45ZSOUU2jl1Qx3ETJ1B1+d7/uiB1z0sSWKKOH14X8ZUR9DtPYbmq+YXRQcGbJenTz9lu612uDsI8yOuo1PXKQm3Mic+bNWycjn3gGnljR1xKtONhXZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608805; c=relaxed/simple;
	bh=tGGAKhZ+FH+TOTfXSCqoHejGCkph46PhQW+y2VLqK64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ecx9N5BA7fXBxO2Mk2jAd5W2QV6+K5hbP5VOzrrMGiturIOTsx4VfvBpu4ru02nmrduEWHtDUcvaYvGC0ElBtmohe97u89VFiRDhcEz1WW1g0cuP8B2Ts6beI7RcIvEZcRsxkG7bi/LKHI4GqP5LrCSSpJ/BjdC0EHhktbPJI1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rpo62eeJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so43511595e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 23:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772608802; x=1773213602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfQgqDvue/EVF4KyiX+OpQ7cgSYz6kuqRUaxn8LjfkU=;
        b=Rpo62eeJ5qIHhhC9a4rnmRsoYLYrXgVT3tng5NKGRf+WSa+FqUcldAksgWlyzhlMeE
         lQ86LeN/mI15S93SYU3UCe8fqwKZsC77+P/pEPv54IreW0YmVKpSt8yXVDNsMQGoaFPB
         fpotq0t6hNc4Ty9a3OagrRM1HUgD1gdIaSvQwZPxRprOT4JvU9C02xOmn5xb9AXNCGOr
         FyTqXay984449diiOpN2PAt8ny3u5JljpPnZ4SzZrcNywyfU6lEFLQ+EIUK2b2jZY3Yo
         3cbgQ1yjx+tdWRbbAnx4qiJ+ilJjDUlVlJEZMO8Ib3qiYk5DoVEnPDcI0MHpbyOkCoWI
         yttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608802; x=1773213602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfQgqDvue/EVF4KyiX+OpQ7cgSYz6kuqRUaxn8LjfkU=;
        b=bndVKVUe0SK51a2vk188FDYM/bTOfiJln9TXt+Hd2CoEtZCRO4+h1xmGSIX+wfmTEs
         HTOt5rWZqsLJS8zYoLQgYFOLkNiPgBnTVMRbGaMIyj7HotO7J2g+teGaehSipt7Es9kc
         zeYl2S0hP1uHo1xCivrYE5fAk8ypxZ7VEmoiG28Zxjeh9SBx8RcJZ2/V2WWLVyvFicV8
         49w8v5P1pqCp1Gk/FiSFQGXcFDLksyyBcZqgpj4Mwa9MpSNIZQW0vJU2nMQONH1TuUME
         ZoPj6CnwmGNKPgSunJeymK53nv8tXp9jPO7/h0krFPJijAWYDirfXMx7/gKatkv6/mfE
         Xh+w==
X-Forwarded-Encrypted: i=1; AJvYcCVThwHfbriYGsuZGW+RBOWwTo7HDKmx7TAUFcG095IfNOTbZhaSR2qHOLtbnYp+YoC5/yTm2ov51flG5vYLT8Ym1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXIiRi/GIef9JGh3xurQdxsIcMw45kvbj2QLdTaC1gc3zSfvjM
	O7u1rWnHWDXIXgspE2Y2r2CpaV1KSyebqGAcY0kthe5y/3ol7ku8CUst
X-Gm-Gg: ATEYQzxVwYo1MW47W4UDNFidfEcqcSF7iFM/+H001WPp4cmk270ijwCs8dOWKyhN6dk
	pSbdxesibWZyRufNuEFNYKThzK9B6mk68UAD1ZFwy9Ji5F9ESXAFzr05qyYVntCgYPFes7wbFMa
	0rJ+xlmW1TDvMz92fAbJZFoxlJ1cmPZk8U1i3H5j2Dyln/4cE/0c8uX+yhsZ+S7XylQuObguTKY
	aKCJxf9jYs5nDyiLZH4OF9k4MD34EOcTlwfh1ZrNfsGrcuipcEqrhiwXp05s5D8xOWGj+d+Sc1i
	lxEmR2Wtvs2UVstDLlaflLgmwvzH2kyQF4t1lehiZid2lUJJWtSCZHzSmjvdUkxdMuivl2KQfjT
	zce2Kzb1I8Jx07q2ndgzcAkFjjnyAHRNycV3od7duIbjiyi8erVoJZ68idXZvUhiMlY7eKfUmvp
	WTH53gzupbCAr6oD5/1013zDuYqlRmQzs=
X-Received: by 2002:a05:600c:8411:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-485198744camr16136855e9.18.1772608802480;
        Tue, 03 Mar 2026 23:20:02 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8aa589sm4989285e9.5.2026.03.03.23.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:20:02 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G3L SoC
Date: Wed,  4 Mar 2026 07:19:55 +0000
Message-ID: <20260304072000.6787-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E5BC91FB86D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28743-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,kernel.org,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Document RZ/G3L SSIF-2 bindings. The RZ/G3L SSIF-2 IP is identical to one
found on the RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index e4cdbf2202b9..1394f78281fc 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -20,6 +20,7 @@ properties:
           - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
           - renesas,r9a07g054-ssi  # RZ/V2L
           - renesas,r9a08g045-ssi  # RZ/G3S
+          - renesas,r9a08g046-ssi  # RZ/G3L
       - const: renesas,rz-ssi
 
   reg:
-- 
2.43.0


