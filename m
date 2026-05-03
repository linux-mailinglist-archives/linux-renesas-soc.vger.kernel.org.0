Return-Path: <linux-renesas-soc+bounces-31898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id avgVDOhA92l7dwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 14:34:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7040F4B5CA9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 14:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0CB33003E9A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 12:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E66344DB8;
	Sun,  3 May 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8HR+HZT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C640DFD0;
	Sun,  3 May 2026 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811683; cv=none; b=T5KkozANGJTizc2YiegSaHw0LVOwvaWrxsCSx7TdSRsrJlsyPRW6vYFQazT4d34xPpfefaE3Vncbk0QIzcPUkJTdkCfZkdT+FKJ2f1EWUaIs+NvEUOh88wXAyZzwADIS7PFdDRUi98W/JXpIS1SrG+fJlin5rA7BNK6zP0zGcvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811683; c=relaxed/simple;
	bh=zJZxprmXhI/iV6BYEd9cyu/7CceV3OufqAI766P4MRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOdBkdLGMpW838Khkk5ab8Zu+I041XS/ErKUj2Vu/AnQeDSJu1ljmyNwGNlrqrUecxJuRfgFPsvN0AYyLfQS9iocp5WHYG0rbXAUmLOV0wexvX9uGVe1VGJVpV6ySwoa6Cm6XTyP887KBMqy19JQ9lIgDwXSHlkrxtz44yfEffQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8HR+HZT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5573C2BCB4;
	Sun,  3 May 2026 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777811683;
	bh=zJZxprmXhI/iV6BYEd9cyu/7CceV3OufqAI766P4MRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8HR+HZTPCTvpvXLOhFc8OBnFnOp82i/DFazmugjHC1W5O19l/LqDkf0cbtwG091W
	 Cona/yLC6HM6AWRo7abyNYAh/UHvGRxXL3e5ZyB/i/lrhQ/FmzMJrA3thdIF/diNMq
	 ULrYCctnISCKl9G5Hz77iNn8iSLID2cyxzKz0OCTgNy2qQlwzC961ub9qgoDs+pYh4
	 +c92jLz8OWHG/rao0NiThqWPPLhdnNnMT8n8aXysiuC3OoLY1EaI8NNuvu7Gv2JBRk
	 IdLKPEcEaTh2/2r+P8RL4eOAYL5efSEQOmi4wrRtkZYBAAAMNSqgg67S9seaWZvQLH
	 xUpp1DcUefiVA==
Date: Sun, 3 May 2026 14:34:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Message-ID: <20260503-magenta-aardwark-of-order-432352@quoll>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
 <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-1-91ac10453d0c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-1-91ac10453d0c@linaro.org>
X-Rspamd-Queue-Id: 7040F4B5CA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31898-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,linaro.org:email]

On Thu, Apr 30, 2026 at 02:22:17PM +0200, Neil Armstrong wrote:
> Document the Renesas R63419 based dual-DSI video mode Display Panels found
> in the Ayaneo gaming handled devices.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/panel/renesas,r63419.yaml     | 93 ++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> new file mode 100644
> index 000000000000..17f166db3ca3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/renesas,r63419.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R63419 based dual-DSI video mode Display Panel
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ayaneo,wt0600-2k
> +      - ayaneo,wt0630-2k

Just like for all other panels (including other Renesas) you should have
fallback to indicate the actual panel IC, even if it is not used by the
driver.  Some SW still could fine that fallback usable.

Best regards,
Krzysztof


