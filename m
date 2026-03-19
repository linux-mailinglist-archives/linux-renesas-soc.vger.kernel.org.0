Return-Path: <linux-renesas-soc+bounces-29866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKPmG6TGu2n1oAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:49:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF9B2C9046
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 10:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B2FE30C30BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855A03B2FFE;
	Thu, 19 Mar 2026 09:22:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3975037E312
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912177; cv=none; b=SyKrj5qBMRMsPiMlahgXkyvpkvwC2inT7VKSjLrZbVTEqBj5mXhJBey/3+4sMWEfJeeIX5zQ/sq3mk08Jkr9LZndVV/FVSHABkQR3ZKhyONV7cwCdJDhkxP0Oe84iFw7GxYaSQo4wMCopXVvNb1cdmkQdiC6pmm2Lju2yCZR4N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912177; c=relaxed/simple;
	bh=xsYlSEBKEhAJUI/2k2Ae0493EyKzWTyh8Ac20dOwYA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhM7B2VD3wX9Z/lSPKVxFIYHAO0rBhUpY7G67EpC7PlZxYxrlJYLAsjN9bmxjvmylwynx2W7for/n8HHt2MBlZ8zbcpN4R+b+rnrzYJ80wKXGmN5zy9/efvlN6eDDayNnnOrrxlefT/fgDxRKJ2Akb01/vhGnM2MQ0xr1QOqz38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5674d8be45eso241183e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 02:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912175; x=1774516975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R7oKWv2gVUp+Av/4dtqoK+ZAhQyBi15VK3avPppXR4=;
        b=BH2ji4QTVaudc8+6IBcjpgJhdP6PAwEIFiAA1wzsr/ayKXA5nGGKYOFQ0Pn4PAHwlQ
         MlXzUI1fwA0iUSNPMqPp/z9aBHim8SN3qxGYoqGFxlBkd9O+nyy+6RkGqkov75emqs+8
         vtAZFlsMb204pDjoCMTWk6jdoJCUGke+E5Pf3oI/duDwolCq5AmF4nJljsIuQewyD9wc
         Fw2yfDg3oHil1XXh2D0q1kQ9zgRzT1CcqMfRY/R6z79Uqalk2UzvMt9PXXECmQOHC/o9
         JnLs5m/37+vUAJnU0drkJvD7a+3P8IL9+Kdpy601NA2rqrFGYxbj96/LHSCEW6FJS2e3
         erew==
X-Forwarded-Encrypted: i=1; AJvYcCWraWS4IKjMuSolO857Z1v1RgxFGp87HLj4bCAEB6+47huKDmSA6RO9UqF0rb7e+MjDj1Lj2sBI1RzqO9cUfSaI5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzED0zfbj+rwKgldZ2Ffob1ltTC95ig+RxfDCEmsBX2j3vrODOX
	3pldBwbIRUk85hjllLYRw86Ovh2joQ1AXY6aIKp+kq/ms7bXdCASaGWapCCSRCUy
X-Gm-Gg: ATEYQzxsbjWFpItXIekW3JqBRwNLni+hETeXCq28NDND8MnncimjRb6MWg0kB1WcXEF
	6EnXdodoM4MkSgdqU5JQsbk0TZZRNEyYN+3PRAlS8PGaAA0Rn2ZGkx0xVJvGkZxu4qgAggAR3UJ
	TXKv1S9dIr9pJTk5Ph9UPl6QWxvA9QUj51vjKRxyO5lH3NK62vca35XcELkKBRUISF6Or2zyDaD
	Wn/fSYMl5xYtNxRPQQWIWw+fXQg3NOHuQtvIc7ulKGw947y0lWxht5/59D2YKR9jmxigaDzPljj
	+SDUoYKzJmrKInWM/AwEz8l/P0UbECB5UhQWbKBlHMjOXgKF2zqj1i33/hO7ya8uvTYL0bvotIA
	wRHS1q+xmi3T5zU3q3i5vwP4vb5hvvvOkFrZWIpQXbKc+kkb2uoKDSmT4+HTzB5AQFB52eHie9C
	63liQlXlFkeyfHevkr/ibb2HeJIGweuL9Tdh9ifBZccSsDrYMFaLR8L83Zn+wV
X-Received: by 2002:a05:6122:2486:b0:56a:f979:a9d1 with SMTP id 71dfb90a1353d-56ba6fe3dafmr3441495e0c.1.1773912175060;
        Thu, 19 Mar 2026 02:22:55 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6fed60esm3217661e0c.12.2026.03.19.02.22.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:22:54 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffa0b23a60so246554137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 02:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkD3LBlDKut1kFYq3xuRWCQEl2C29J+1DiJ7yWpZEPQUE34VGjCXAsgchk22wpa7HwSgKp+9zPycqKOA3RcTnKfg==@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:5fc:2b19:f7d9 with SMTP id
 ada2fe7eead31-6027d38b928mr2511117137.29.1773912173468; Thu, 19 Mar 2026
 02:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 10:22:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
X-Gm-Features: AaiRm53HlmfFuAaNSpgq0fW3s48A2x_PU6s94_11fvKsqDZNlyduvi7IWb1MQfU
Message-ID: <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,mailbox.org];
	TAGGED_FROM(0.00)[bounces-29866-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	NEURAL_SPAM(0.00)[0.415];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,mail.gmail.com:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: 7BF9B2C9046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CC Marek (for Sparrow Hawk)

On Thu, 19 Mar 2026 at 09:49, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> which connects over PCIe and requires specific power supplies to
> start up.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> - [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
> ---
>  .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> new file mode 100644
> index 000000000000..8b8be572c930
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> +  The UPD720202 supports up to two downstream ports, while UPD720201
> +  supports up to four downstream USB 3.0 rev1.0 ports.
> +
> +properties:
> +  compatible:
> +    const: pci1912,0014
> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd33-supply:
> +    description: +3.3 V power supply for analog circuit
> +
> +  vdd10-supply:
> +    description: +1.05 V power supply
> +
> +  vdd33-supply:
> +    description: +3.3 V power supply
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd33-supply
> +  - vdd10-supply
> +  - vdd33-supply
> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    pcie@0 {
> +        reg = <0x0 0x1000>;
> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +
> +        usb-controller@0 {
> +            compatible = "pci1912,0014";
> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> +            avdd33-supply = <&avdd33_reg>;
> +            vdd10-supply = <&vdd10_reg>;
> +            vdd33-supply = <&vdd33_reg>;
> +        };
> +    };
>
> ---
> base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
> change-id: 20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-331b26d4fbf6
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>

