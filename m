Return-Path: <linux-renesas-soc+bounces-30843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHe/IU+kz2mZyQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:28:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D22393AB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D8383020597
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 11:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716CE1A294;
	Fri,  3 Apr 2026 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTqx9WJ8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1D03B47D3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215649; cv=none; b=bba8r2h/m/yU2QDUUKnrtgyZjjt5irr52T3a8Mo9en5t9i8Q9OQlSfS8sYJPtnH3QMyjV0/yOFXUSoIGo1/QIcNuZcd/HjcgCRpWeuvBbxTlUz0ZF+IM7gYyTeMIT6sDkWmvs4Y8aDmxzN54t0n8NMTkZEkGvXSyylMdVJPsT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215649; c=relaxed/simple;
	bh=aO1j+V45gKVspVh+STk4Nhcf53cEsgoJkFmIjjpcfHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=baLMlS7tt9Lq0RIuXCW3m7PAiuwqENvB9EQ//7wX22Alrw8H04BODyjZpLqqu/y8OOXG/+B9btc6+1Hol0veQRX2q1k/4+ltqfOSa/+88oQpiP3gun49Fvhgdd+2Blv6GfBG6arqZeeqFJUC5GkE0cE6Hf6AP1rjVORSXlplc2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTqx9WJ8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82c70e4654eso847396b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215642; x=1775820442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NHifJZgQHQqWkUaJjmrpZ1+zeEyrq0oDIlsASkhbXs=;
        b=NTqx9WJ85Ju1zwhHb0HDfYYccjBZFaphv2/UeMJNyKp/g1Yu4udwbdIz5His/9OTcq
         O1EwcQMRTJPQx0ZjYXykr+ksG+ZBS3WqqLaBH+PKEBq6sIJRIX/zv5iw1a/TCrjD6IfJ
         ob4qsKmVnKKzl3viloDqi3foSi62yGzx3l09Ey6Dj+VPkhsTSXwPUzbbnro+qbpW7fg2
         q5D7gjC3jp+vvX/o3yAx9aGNbgaxowKbcfYcv7fH3Tu4uRAqV/YY+uqVxTPhF26c3Qry
         JnjNe4TUbjv0KEsWJ8LkKDF20P1yozVWz0EaHnTYJWGXXNIc1zdqAmxv0md8R9ogRYqG
         Zrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215642; x=1775820442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NHifJZgQHQqWkUaJjmrpZ1+zeEyrq0oDIlsASkhbXs=;
        b=V2rIU9m/4/Jzx3wZBbdBTBhrc5TI2NBLgFHEQ5XLL8wdS8ZZuZH+GNrx6xQ0lvfpY4
         1KNKH3WsdnMSTHjjMFnRPeYaTJqoF74csbKU7I80G4Z4gm0y6WEJXZWEgxZ/hlmumSbC
         MC9FRV8Mf5ENh8pDNzFOdl1xWHYArTCkHKRid9Y7PPT5EmStu3wwLPWCMwZyuSEnR9ng
         zAYU+xbL1C9exSf74Uch7EA5uEXZOucQ89+kk1+vBEyEgV+//QiwW7C0SOCN/n1wm/Qz
         6JmieUSMS05+w4loBebI2otP+gjeVbH3d0a4zXcmj1t7WrYSdXSbRU3O+1TJGAuH5PDG
         dbQw==
X-Forwarded-Encrypted: i=1; AJvYcCVE5plzy5O5cORDNbUrlFJJAhgkUZglVdEjAjWi1VylMH3Z5DtafkW4qM91h+8cPikPqZg0FOe25AmA1Eu2ejlYJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHop+NA0HylbD2IjPx9iKc8GUrs3RmBRs5ONzjZtHx0aQPg7KV
	+NNoyXI6kA/rR6eZKxbc1Y9mLogjCVFHzlrsHXDIrQXS1G9N/q1TonOy
X-Gm-Gg: AeBDieveUpNoVpDsWibN6MkY80s5G7Y4tggxPgLGj1UxlUmsxq7RtmT/QvuZa/cSIjB
	TCXnoRoY4bgbTQwr5tYyOgoiJomk/oWQUTtz2PRYGmHn3ZjBehFFnjDDE6YY84I4wqBXLzBOSAd
	PYUHyQxZcZtMN68zaCY0TAfy9XdaBcZpHrDrKpHg2aMnZW1owPBjSFNUjUMxVVE2FI/TMrbYqi9
	XkG4X/BmjSKz9DLVbptpWOzeUfdOGivI1loi5WuBfyWYQyDXiDV6haY8tcfgGWpsVCLqR5DzT1S
	khtCetrXxTZ2UyrSicAjvUoXGBfC2lCZj6Mh8Kgzv+lKaeXu6w4jXf4TINLtv7Y7yLR7Ez9C3DD
	yW/VIslXSYkwA9SgSOT7/pTHk3zghPIjox6J0EE2gYLBcEPQ02N9AC5nutqiBlXA45x/0C1qKBc
	3GBg52CPBh0VrfyzXnmNEccX5mMngao1kLOGJpMdD0+3fkv235+SOwucwz5A==
X-Received: by 2002:a05:6a00:1745:b0:82c:21df:807a with SMTP id d2e1a72fcca58-82d0db6ac7bmr2642877b3a.26.1775215641956;
        Fri, 03 Apr 2026 04:27:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Fri,  3 Apr 2026 18:26:52 +0700
Message-ID: <20260403112655.167593-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-30843-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 27D22393AB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its internal registers. Without this clock,
register access may lead to a system hang, even when the FSI
functional clock itself is properly enabled.

This series adds support for the SPU clock and updates the
bindings to allow multiple clocks. The driver retrieves the
SPU clock and enables it during DAI startup, then disables
it on shutdown to match the audio stream lifecycle.

The binding is also extended to support additional clocks,
as FSIB may require more clock inputs, while FSIA typically
uses fewer.

This has been tested on r8a7740 (Armadillo800eva) and fixes
system hangs observed during audio playback.

Patch overview:
 [1/3] dt-bindings: sound: renesas,fsi: Add support for multiple clocks
 [2/3] arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
 [3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock

Thanks,
Phuc

bui duc phuc (3):
  dt-bindings: sound: renesas,fsi: Add support for multiple clocks
  arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
  ASoC: renesas: fsi: Fix hang by enabling SPU clock

 .../devicetree/bindings/sound/renesas,fsi.yaml     | 12 ++++++++++--
 arch/arm/boot/dts/renesas/r8a7740.dtsi             |  3 ++-
 sound/soc/renesas/fsi.c                            | 14 ++++++++++++++
 3 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.43.0


