Return-Path: <linux-renesas-soc+bounces-32627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOJpJJLTBWpUbwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 15:52:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3965542822
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 15:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B22DB30BA46A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584233EFD0C;
	Thu, 14 May 2026 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7EXKpOW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3409F3EE1D4;
	Thu, 14 May 2026 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766475; cv=none; b=naP4M7ChjirUoOFr8Z4iUhj+JFUmGeFoME/UHQxFEIB0DPZdVcJoUie3wncJnEhjhleGHsEKf/l9zTWI+pqkl74OP5NNqYuZ/5BP2VaNs0ydHmw0/O5YAhfhK/gl9ei9AU3/afrlZYgIle1xlDWjNYsUK3qwp9YtR2dVH55+WVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766475; c=relaxed/simple;
	bh=foSUTTciefKu/0q7fLl4eDlK+a00fo6AsT5VId1gV0g=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qIqe67YJ4XyhDdQ4zdwCAipNunfyJEHDwk3RU1zzyUp93Kd21WPZHbzNUXC7oF/eLSw8XukTTkW2zQ+hM3kHzfNOZmm/EJuKjom6Ba75xYTw6t84gi0OsdO4IjduJHKZPwQyA4dP9KB98S/ZUFFjnb9NzSWVIh9ZbMJJM0tiNbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7EXKpOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABD9C2BCB3;
	Thu, 14 May 2026 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778766474;
	bh=foSUTTciefKu/0q7fLl4eDlK+a00fo6AsT5VId1gV0g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C7EXKpOWFDkvDfP/p5daDRdRVCwGfDPPZjOkgTeSJyoed/M0ElC97exv5FIfXjnQY
	 cKtbTi+LBroo5O6Sn31YPv/w7Cb5UcvQsNO5HcoGAKD6cnB9ixP0D+iqlZ8lBocRLS
	 hWiCYd4K+f4vXOPbDeE0vGGtOexTXdCEM+fAhd8vwK5kG6ifZtjtYNp18eXCje8kSk
	 yEGcuC00P7s7lEdyCuU1pOqTHL+4SFtsVXJL6pLRTOcwc7Dy666CPCJUO99G9qHfll
	 G6RNDJzKRmY6sms9uYMfuPFvVTJy2CdQcRSJGYW1+XIdfrnHq2eWL5VQ7zcsRqPILS
	 BSSB6/uUW3yBg==
Date: Thu, 14 May 2026 08:47:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, dri-devel@lists.freedesktop.org
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20260514-rcar-du-dsc-v1-2-d65f7a9e9841@ideasonboard.com>
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-2-d65f7a9e9841@ideasonboard.com>
Message-Id: <177876647180.321742.13836175505095800376.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
X-Rspamd-Queue-Id: C3965542822
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kwiboo.se,linux.intel.com,ideasonboard.com,vger.kernel.org,kernel.org,pengutronix.de,baylibre.com,linaro.org,ffwll.ch,suse.de,mailbox.org,intel.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32627-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,devicetree.org:url,feb8d000:email]
X-Rspamd-Action: no action


On Thu, 14 May 2026 15:24:54 +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/renesas,dsc.example.dtb: dsc@feb8d000 (renesas,r8a779g0-dsc): reg: [[0, 4273524736], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514-rcar-du-dsc-v1-2-d65f7a9e9841@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


