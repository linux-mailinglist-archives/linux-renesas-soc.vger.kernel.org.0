Return-Path: <linux-renesas-soc+bounces-34176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id knHAE7XBMmqW5AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 17:48:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A8869B201
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 17:48:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aUbx83mX;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADF8932F31CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 15:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913CC4A2E3F;
	Wed, 17 Jun 2026 15:41:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D4149691F;
	Wed, 17 Jun 2026 15:41:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710914; cv=none; b=MiP03u9Xu+/T9+xhHPgFosFykVFOzAfcDOCx/jAElXralqXIf/68fxb6UxJ8K98UxmFfP0TdKhwYyRD8HWG573fOlXeUd+Agf5CqJgj5UBmN/E72AI6g1gKXFIi9/JHkVjimPxVNmuib33jFw+h88zMtJxppyyGFa7uW/dfskCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710914; c=relaxed/simple;
	bh=K96JSwwaowjEbeviUI1xlnKyD4dXQgJ11kqwaYRZRSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BQ2v2FJyhyM9c9fh29vE/5AWGTdKDvJjamOg+HywHNc2sOyFmX8/1TwGPr+2u0FXedE74ov1jO6npYW44TsMZ/IdpPLGKQU39l0f+12QhUtARny1KpG8tlvJCtuQp0MZ7Fy3yCyxRfOM5aChbcnbqC/ae59H5VwGmENl8CAgMww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUbx83mX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B0E1F00A3E;
	Wed, 17 Jun 2026 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781710899;
	bh=Sv7WK0TLi0qOIuMOvJwU6mbH3yERNXs7/fEc4Hx4c8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aUbx83mXCE+WKkE8VV32ftbCXH0r52gqX/y897tbK6cSBbc9oFa1CUdep0NNkVDMS
	 u1jZqyq4K4DGwBLuqJiU7r/RAnQVDT3t/P+wcgUp6BkJnAAIix7vvwpwQ0iqLN0n6J
	 qyPN5BkiHdYRo8lFkwnsoyQKBT5hRQ1MotmAlsK8sL877MNk4V1bv1wgCVUxZUTbdp
	 qcWZF5PV3TnwPXfDq3bVuh+ClBEvwcJvXRfPqCkxxM068kS7C8fEWjhELds9UqdLQa
	 prIzA40cwi5BaIv+lv0yZ6bIIA8QFvcZeSCB7ACyf7gTVDTlZrM+TxumhSTupvvnz4
	 OKYIzZGXkiBJA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten
 checks
Message-Id: <178171089542.1654059.1933552286028471529.b4-ty@b4>
Date: Wed, 17 Jun 2026 16:41:35 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,nuvoton.com,glider.be,sntech.de,iki.fi,kemnade.info,baylibre.com,atomide.com,oss.qualcomm.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34176-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99A8869B201

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

[1/3] dt-bindings: mfd: syscon: Disallow simple-bus with syscon
      commit: c11c918b40295dcb0ad2460d9534454072386f4c
[2/3] dt-bindings: mfd: syscon: Drop custom select for older dtschema
      commit: f78049ca80ba2e68f7f46870b0d68eb54a6ce378

--
Lee Jones [李琼斯]


