Return-Path: <linux-renesas-soc+bounces-27176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOPpKRGVcGlyYgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 09:57:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B2253F36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 09:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 007F8801EC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 08:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2988F466B71;
	Wed, 21 Jan 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJqvQW8S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6B44A72F;
	Wed, 21 Jan 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985563; cv=none; b=eTqrJKF1+SL1Qe5/hSrxneGcxJPHkvsrUTo60E5m4e9XJA3hPxj1PHOY0eQbmu9h2hdxNQ6ULnsHWyFnx1NTLabruS7FaFyRWM79+g6VfzbYJviSPis3eMzGXpY6Tg/jHxGwR7kyyTjdLEXbJ3BIqYGXQnB6h007LcwjTA7igFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985563; c=relaxed/simple;
	bh=7IuyeTBGB9vtwVg0fjXb+TNVGCpGAtkhW8RPfN7komg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FR01tJ8lg/usRPLwg2VPSsAmIEBZep63smSzRTwe+QTUe8EpHQOmmK/YGJrTAdEnjwdrFzl2EZWChes8/AjIgEtI6UTOoCSkYEu60TvhJMFDoQh1Te8uHDniTpeVoyzrjLBC0pa1vzwlV9RfJR162KdgBJi97k4Laqtye7jc4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJqvQW8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B2CC19422;
	Wed, 21 Jan 2026 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985562;
	bh=7IuyeTBGB9vtwVg0fjXb+TNVGCpGAtkhW8RPfN7komg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bJqvQW8SGmylTnXNovPHWavczfeprMh59Ggezw1TJszWg6jbLyu7DTdJJcaAw80E8
	 TH6UpSk2kTTDummOiISVBfjL8oFtEGMM4ynUpLoJuhIWumJAiXlq07TmzYhExocczA
	 q6bj2feluW+3mXXA5yy8/O2JRXksAUn+fnjd8bQJ7QlogMNGC8zgxBTjLbtJEXMVGW
	 3uIaBpuQitKneqfyaOl+1JfwdfnDFR58TD1rEkd7tpbZzVnBLEkgOZ1ZuqcM9EdV6n
	 6qd0bL9PDJv3CfgpfNrnORHE+y5ZjPvj12vqTx7gee+SWg0P0WUmRR+OYSl4nUGslP
	 CF6vpzLyWKEtw==
From: Vinod Koul <vkoul@kernel.org>
To: tomm.merciai@gmail.com, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Georgi Djakov <djakov@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Subject: Re: (subset) [PATCH v6 00/14] Add USB2.0 support for RZ/G3E
Message-Id: <176898555102.1268719.14451101267712525788.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:22:31 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27176-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,axentia.se,kernel.org,linaro.org,renesas.com,pengutronix.de,glider.be,gmail.com,collabora.com,linuxfoundation.org,arndb.de,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 58B2253F36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 22 Dec 2025 14:43:34 +0100, Tommaso Merciai wrote:
> This patch series adds USB2.0 support for the Renesas
> RZ/G3E (a.k.a R9A09G047) R9A09G047 SoC.
> 
> RZ/G3E has USB2.0 IP that is identical to the one's found into
> the RZ/V2H SoC (R9A09G057).
> 
> Merge strategy, if any:
> 
> [...]

Applied, thanks!

[07/14] dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
        commit: 274038b82f413a754ffc6fbdb771a3ac62d1bb4b
[08/14] dt-bindings: phy: renesas,usb2-phy: Document mux-states property
        commit: cd597ce6460dc01f30f0f4158bbf20624c33c594
[09/14] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
        commit: 642c462854bf1f20e4d61a06e880c1b73bf6e542
[10/14] phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
        commit: d6db3b3af74a26b65d1ec1e86f9738c784e7ae29
[11/14] phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
        commit: 230c817a1601af3ac2c9fdf3fbde9a3fee6bd26c
[12/14] phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
        commit: b6d7dd157763e0c8937f60241fb4af9eb546a7fb
[13/14] phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
        commit: 8bb92fd7a04077925c8330f46a6ab44c80ca59f4

Best regards,
-- 
~Vinod



