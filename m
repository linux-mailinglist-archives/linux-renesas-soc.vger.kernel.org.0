Return-Path: <linux-renesas-soc+bounces-32678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACLcC5wUB2rgrQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:42:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7D54FC52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F7FA308E0F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2DC1EFF8D;
	Fri, 15 May 2026 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGI3PXG7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB663AC0D7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845929; cv=none; b=n+S/gN0oHKmxJRvJm6DuchaDrhV1Cfv8adjfLYJg8WYqSDB6eFij3nVADfb9mWFKjsQ0nZ65LHrbPC5mm5ebZ2tmA0NpLG81EwwGVinWh43EQmwIvV7Ywd+xfTyCzLArwOFi4JBTPvpnvGVZikK+ghYSkIcNx/PBIMoxL9RvXqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845929; c=relaxed/simple;
	bh=Jz7CeHrl1MiYEi9egt1Sa53DTAZlZ+92EoaJBz3WSlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkiLzvjseSxbcWNkIZxTbuD0bjyLh9UBM1mDYXqdznyyz1Bg6Bcqau2gfsYslI+aWBTIzhBHZUCM4h1ArozFNO9cwqQYqy61HNt8UIJvNwkCXAumT5Bq5uVKVokT3eGNqp/sffIsrhL+zKAiQ2xsmI6HJ+4kpfFVmWo2i6j6IqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGI3PXG7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so5189415e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778845927; x=1779450727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KpHry5QF5zqM8TwF8sF9NKXYmfgtKgMFk4+Fvwn/DjA=;
        b=pGI3PXG7wdnUF1y+hvAE+OybhVHi1/B/W7r1qxNX0DoeddELdtkW3XykL+IEcBoEhK
         +9If8Xm4BB3mykYbkWIVgcd7Km6lp2o696ZT77h2cL6LlUxvPmIf9Sq+1moYWwgj9uip
         V1VAuv7+3FmCUkHP9UWoirBEa4BR/9pvmeqhSeeKWpozsE7nhw6w2XnDTe5EfCzB61Lk
         5KLYRatJyLJp3lR4oHTi80ub9xNYNz0EG7X8rU76BVOs850fDqdG+wXtqon/8ZzcJy3W
         USya7RgqWZRIbj1mSOyUE15JhZKFY/bu/teL7iV2PMkK5q2wddBR7WRVwOtLVw7glq6i
         nvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845927; x=1779450727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpHry5QF5zqM8TwF8sF9NKXYmfgtKgMFk4+Fvwn/DjA=;
        b=N4GjYBBa1aN3Y8pLY1X+86dlfugn7JF1zTX09LPq/3kfdp4XAqNt5EaQfdu4Gto2iT
         Y9oYscE5q7moFdTZtYh/jmhJ8QujVe75mnzngG7ZIIGKZ+y+61fV62pSobZZfh0ve677
         L+zLRjX3EET4eSq142c+nLqUsuGlEqdougLdjUIr/qN4XhrwjwIAhcyt4aFkT6Rvs1H2
         gcaK+zRTTZP4Q93mHssf6kA8Xk98CdblP4f10W72b8a1kQkMuEKHArrvTjFqh5W0L2XF
         hmkjkRwAMlFPu/qrfh3bjPl3/g03diVQrgCBntrfYauPoPplisIuj5nU+GjyMp2esxpU
         2cfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oT3n6eLallhRMFmX0usr5eriDPOtQWRjvBZDALc160ozxteluSSk6guC42ifaG85yuCQ7GJfYQCc3/3LlclSKOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+mOK63+WUMoga3UMC3ctK2zoJndqhDnkb129e2lBLkfUjql1n
	17l4po5TRiiTUclxjpksp5WxUeolSGM9nUhJCAZ/LyWRK58HJ1BpxVrm
X-Gm-Gg: Acq92OH2W+/VbpUvDQlZAnUWzOyD5ErUIoOC4ZYavs/XfbN2qIbkw3e2yAIJhwdoCK2
	as+yHDTcVBJjAmyXbEyleLidJb3SeHXvpOWZ9PSvBC/ZALZKOdyU68MvXyPkVWRC2NETF3S470H
	SYEznYFOWpJuShhHgKye7f8gd2wLpewe8rnYSbSb47B+WEidoSWHv58sjQl9BZuKJazJemttYrG
	KVu+hWZRG9lM6g33Nw4Wd7if47NAluxcM0LUdvl84jCBXco2wnU87FjB51rwxzECfuxHQia3OeH
	9q9UxYvwKQIXdavdG32KSZDU+RUowVnweRtVZM4D3ughdrg9wL2rCP6OcqYBzkGWKuFAzzSJ1KK
	el27U3m48Bfapofa6np2cU2aHsNvSjwdGqrnaba4fMNo1D5tIxSl4FtdEaqqsxX9NVyC6Q0pwkV
	AlcNA4SoEx5WVCg5ptPaKY0e+A6/TpLYPk/Tko4rHMXQCnIvFyP6xBkTTzgKv884pqPZJkAA9mv
	oacATcYPupfNZ0oM1ENfExwRUG5rfCi0z0Lk8oaDtVVWiA=
X-Received: by 2002:a05:600c:1914:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-48fe4dac5efmr48051935e9.4.1778845926218;
        Fri, 15 May 2026 04:52:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c85a:b53f:fa7f:6b1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm58376215e9.14.2026.05.15.04.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:52:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] Add xSPI support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 15 May 2026 12:52:00 +0100
Message-ID: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1DF7D54FC52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32678-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Add support for the xSPI (Extended SPI) Interface on Renesas RZ/T2H and
RZ/N2H SoCs. The xSPI IP on these SoCs is identical to that found on the
RZ/G3E SoC.

v3->v4:
- Added restriction for resets and reset-names properties to have
  maxItems: 1 for RZ/T2H and RZ/N2H SoCs, since they only have a
  single reset.

v2->v3:
- Used RZ/G3E comptiable as a fallback compatible for
  RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
- Updated commit message to reflect that the xSPI IP is
  identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
- Dropped RB tag from Rob for patch#1.
- Dropped driver changes for RZ/T2H and RZ/N2H SoCs since
  the xSPI IP is compatible to RZ/G3E.

v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
- Add RB tag from Wolfram for the rpc-if duplicate device name patch.
- Added xspi_info_r9a09g077 for RZ/T2H with type XSPI_RZ_T2H instead
  of reusing xspi_info_r9a09g047 with type XSPI_RZ_G3E, to allow for
  better differentiation in the future if needed.

v2: https://lore.kernel.org/all/20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note, patches are rebased on top of next-20260508.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
  memory: renesas-rpc-if: Fix duplicate device name on multi-instance
    platforms

 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 drivers/memory/renesas-rpc-if.c               |  2 +-
 2 files changed, 51 insertions(+), 11 deletions(-)

-- 
2.54.0


