Return-Path: <linux-renesas-soc+bounces-34534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 76oAA5fTQmr7DgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:20:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 501AA6DE986
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:20:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="QIze/DRA";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 003C93045DEB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 20:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11AB38E8AB;
	Mon, 29 Jun 2026 20:19:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B28638B158
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 20:19:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764379; cv=none; b=BEN3fiPWw8WS9QjvqzqeAEFDeyIb2CuXo+lerG2Ydq6Df7dfEMfsJdWvwq4MywHNhsnAafcW+ONoBf3KxWboaLRNPy5neB6DmPaFlGMkTA4ZS1vZARCRHdPmY6ZQ1l2JfZvgzsD1kuXDdk6U0fXw4Dc+/XbFbd7wcJZjQQ5dP+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764379; c=relaxed/simple;
	bh=pdYxeBI9YkOpfxIvVwA9F4HdzieF6uivgjdrMwZAkmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GtwHGbGoByRdG06QDU3bw4D1eq2pd3KjCwL36DIlScojkQysFKhZu/C+vGbCFsX34Irl2stFpqkthoYq54Qvv9tDzufbgGPrb+P/F2p5qb0qFK16IYPL0Zv47oAr3nRym6K8Ovz9f+Emkzga8s8NTsuWSegvf+CLf6XEVVfh8pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QIze/DRA; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c9e9a8af98so8762625ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782764373; x=1783369173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=;
        b=QIze/DRAV+9cyF54qAB57jhEkjkG9jxPaV91RrUxRXIOrRtvu7S753TGME+MIyHI9f
         n9GbosdCnh2HoGIxV9rxoK88+OvpvvR8+f2cO53Y6hBhweHnMOLG1ZTq1cK7VUwq2liA
         DuSmmy2qTHkNfEV7lNDSQH8C+4ERxRZLEvPSzPra3rgYGEM+zJdNM5bB8ui4L3fctkHk
         8HZAiZngsANdUGN9ZKZkpWVQXUSDYb83IjchKnGw0Q9sfGIsyjxQd2QR+lMmBgQ0bWwo
         LKaSm8245l8POJTygYnkzLBAVxnVxm6NeFBO1VoecXCgvyHrmwp559G8UwdAAQJvjyh8
         tCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764373; x=1783369173;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=;
        b=EigDqgoY2F6SMps0pozLSrn1j2VJBSvlewtPnffRM3NwlxYtsU46X8Q5n7QlcJYaDe
         qd4xIiIk2zP76GsHUbZSSagebIH/dS8x6B+kS+B/QO9bmMAe9mdEKxzKh0PkomRCR9Fy
         96ssMAKf6/205R9/9tmpykIceNHnZUnVkR6pIepORgV3+KW7OcrNfWj56rAiC47MrYFV
         yu7Am/M3XoslxZ/aF+lCikzGY5FmiVYnGc+bADW8VHTT/Hn5zlkzl4Uyx6NeSM/SPXo1
         V6FK8Q4h9KzacSBf/boMLP/Br8ktEobgb02fDYfK3b0Sb3hknsH0+cTxJfVC+lp99QJ3
         Jyng==
X-Forwarded-Encrypted: i=1; AHgh+RqR1APSRg8D43N7vTsEoquvzecFoDFlODmeowrj7qoy2sYDlYPcO/HJnd0By06KmrdRSrE+M/XLdETwembmNFRgtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdLgsuDJSHtfOsu/v2+Q3qc0CeAJDGALcSXPHUaKI62B1kqEsZ
	hLuAF23YWCkRbWY547/Y5aijRLYynauj4e4XAKW+6NYgnScD8wNgNYmaOMQIf4hE4Gs=
X-Gm-Gg: AfdE7clR5rDl19SiogZif57Vmx0mM4qlsLiVn3UFxnm3dm0b74cUtrp8OQfNNNFwAwL
	3zTYRmslTOthELOQzm1S7LiYW+ijsQxTUaFo1sdMkCkhXHz5o3XF2ykgcgwuxpWK1BLeST/tZkT
	/uN1rk36mGBdU0fsS3dYqUR3T6KxsIU92iW5UNKvxZL7tlLF3ySiv9bCsIWo5dV99/juUCxkmoG
	KpworAdpE4UvNiAZwsfwBQyh/gP3mdF/8NJo6hQ6Sz32p6bPljT3IBXEYzCRfmtN7NiKiagyjtC
	cXnEA+uL74jSzcrYjwyWnPGl7ynCfQCYBP0QoYAoPNG7LVBsNddBP/8vZCzj63FnvBZjawQ+qXt
	82wEqzOZFKmtIZjCPcbbx4XDdKtQMeRuAwaPns5Zhq/Su8x8pQilRoD8RtzadKgG23D2DEFn6IJ
	FnBDv8tNtJjg==
X-Received: by 2002:a17:903:1c2:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2ca2d3d202emr6219205ad.0.1782764373360;
        Mon, 29 Jun 2026 13:19:33 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ca37c908e7sm102735ad.35.2026.06.29.13.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:19:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten
 checks
Message-Id: <178276437217.1055800.1836973932721840283.b4-ty@b4>
Date: Mon, 29 Jun 2026 13:19:32 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:rogerq@kernel.org,m:tony@atomide.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,nuvoton.com,glider.be,sntech.de,iki.fi,kemnade.info,atomide.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[khilman@baylibre.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khilman@baylibre.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34534-lists,linux-renesas-soc=lfdr.de];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 501AA6DE986


On Mon, 08 Jun 2026 22:44:23 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Drop patch #2:
>   dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
> - Bump dtschema requirement
> - Link to v2: https://patch.msgid.link/20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com
> 
> Changes in v2:
> 1. New patches #2 and #3
> 1. Add missing part of patch #1, thus not adding Rob's Ack.
> https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: ti: Add specific compatibles for SCM conf nodes
      commit: 68f994ec51e279e63c8fc40c1bfa8add4b708111

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


