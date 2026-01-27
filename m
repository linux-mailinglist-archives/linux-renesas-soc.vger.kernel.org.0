Return-Path: <linux-renesas-soc+bounces-27473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFf8KHmSeGmxrAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 11:24:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1292BFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 11:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 831AC3008D04
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 10:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054F831DD97;
	Tue, 27 Jan 2026 10:21:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB5433CE92
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509273; cv=none; b=Q0qwCNCKfGFBSJAX0w0pJU+lvnTzpitIuBjTOEeD/1WpmobKfYmb8Inrtl7xkt+0oPkfkHxoclgL3h64fBNsqqPBR7kWqV+hyXJ1fddcEgGVbRcSU0hAqJ88lfA8slzuaIFhSoMGU1GNO8ZFDCxeJ8KKKTbivswe8pOGGwHXzGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509273; c=relaxed/simple;
	bh=VR7NKRn1EzgAvvzhExxtxmFQMZZBrouxWpYgT74wAco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZunALLvO67L6hs8zjh7PIdEWpsNh8s6kKMK8xz3YwLzSwgbHrZceMF5paenF2rpSyif97e9zPduNNl+WXnc72dG2X0xCMByMEPex6kBAJkDnN8S4XpwHaJR8n6eU7Q4BCB0fWSig0kBBGoD3XhUbNBcUv+YPWehNLSRYwRvfzRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-5634feea416so3021502e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 02:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509271; x=1770114071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h95kKSGuxlIi6DsiBy3i3OTVnWNnI1FQj5Fv8XU8C14=;
        b=E/V6DK+vYxuO+VxDKbn68xbppyLVICGsQZ889+DppmFndoU8JOqVOefC4u97GPjayu
         cmRgfxkYG+2QiogIDDLAu/ca3vaXH3tr6AvDGlLqhYZcvJYMmDvOTdhuIPNpTV2oJ5ya
         W0VpIWRdnz81MxR99tno+vN1S7aP/+qffRDtysmYjdlksc0RjTOQT6WHJCz1a1AmWS8a
         gS3BwC41Tg7xoJEFnCB3fTw9Jg1xKspJKizTjXEqpmaLxZwzvHQzuTQqX01r3xWX/VFa
         2BKcp8OKgkbXCIajKHYASamm+KZAdNKc2yL1ae/PtSK7NxiEqZzDwG5tEXWt7DAhOVwq
         Cazg==
X-Forwarded-Encrypted: i=1; AJvYcCV9l/Si5WEPEUpVuWpBkHpZ/yE6WIC+r9ehZRx0bPFmwOypCmDWuQCjkD/KaVcM5p3UrXt7K4zLa5L+hv5FNpijSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJwD0lG8YQlS/lMz0I+VU7RgaW2Xu1AWIBdd32adObG4m3sAfU
	0U2tncY1sGlNojJQm3M8HSswhG5JRrr2vEbHVhOLSuFxuVXH8c0F721a4EWyjiepF7E=
X-Gm-Gg: AZuq6aLTBkUIHiwKt4RfnCodUK0740ADYYiD9EhXs3SIqZYq0NG8jMbDst2ANG6Afkh
	8wuT8wn1sdshbBsWRxuParyYv6EuAk/5AdMe8Lz1AQ9DV7+eGwbRViWsAITR4ZXPN5eTqr+9fGq
	4X/z+HxoA9yUkdtrvskPgMfdJNsjaHGMuCDIg6KCVpUs73MsQszwAVUgsR33+5wbHyb7QnLeyrS
	Z9K1MAbGCIMZ8TlOKrVB4vsUKNNyzh3nJz94/gx5MsyKa3EaenHDN2gzQFCR2VMUC/GXnuuIcFB
	5sbKc+uYHKd8zre6VMxQTewvac/Cq6GC6pqicbxNDJKVOswBq3HUNnMoePg7mvhYmEe7xhxIjfy
	TsmhjDx+eceLHzHA8AS9P2DCiUzEjhfrHcrmu9TucxeRygdzc+WK0YEJqNmCcAFnm8fDhze9zlH
	uQ6S53JNQBxh9erb7yo6f0mNXecfH8A23QlVLiA/tw+DavNwRKTxYwqYBWNLs=
X-Received: by 2002:a05:6122:319b:b0:566:354d:9f4a with SMTP id 71dfb90a1353d-5667949f0c8mr440962e0c.1.1769509270955;
        Tue, 27 Jan 2026 02:21:10 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7dab9sm2207985e0c.15.2026.01.27.02.21.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:21:10 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94120e0acbeso3156855241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 02:21:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVekavbieg2FXhdKadBmOlHq0gnDWPAGtGrzoehD41Xwa3lIqv/9SFZ/1nmRFTNgFNx4+I1I9tvbf/NnDVGmxHm6w==@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:5db:ca9e:b57d with SMTP id
 ada2fe7eead31-5f72368a7cbmr661077137.19.1769509270640; Tue, 27 Jan 2026
 02:21:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 11:20:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
X-Gm-Features: AZwV_QgWv7FB_90Ca_fAZmW1VQjnUFaVdHL_S5QmJWKKvUrnnNh7whB0F4bfOtQ
Message-ID: <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-27473-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email,linux-m68k.org:email,0.0.0.0:email]
X-Rspamd-Queue-Id: D5C1292BFD
X-Rspamd-Action: no action

Hi Neil,

On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> which connects over PCIe and requires specific power supplies to

Here: "requires"...

> start up.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/usb/renesas,upd720201-pci.yaml        | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> new file mode 100644
> index 000000000000..df3cdcf44747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> @@ -0,0 +1,55 @@
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
> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
> +  four downstream USB 3.0 rev1.0 ports.
> +
> +properties:
> +  compatible:
> +    const: pci1912,0014

Just wondering: how does having a new driver
drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
compatible play well with normal PCI discovery and probing of
drivers/usb/host/xhci-pci-renesas.c?

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

... but no power supplies are listed here? ...

> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +additionalProperties: false
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
> +        usb@0 {

The actual DTS uses "usb-controller".

> +            compatible = "pci1912,0014";
> +            reg = <0x0 0x0 0x0 0x0 0x0>;

... also not in the example?

> +        };
> +    };
>
> --
> 2.34.1

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

