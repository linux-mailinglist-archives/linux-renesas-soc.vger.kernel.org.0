Return-Path: <linux-renesas-soc+bounces-27485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E4PO3PgeGkGtwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 16:57:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5B973E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 16:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E02E302382E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 15:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8440A3043CE;
	Tue, 27 Jan 2026 15:41:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3EF3033ED
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528517; cv=none; b=b4/ApBOr+5xMRbpEz5AVUl1rb3OEuWAKJiFPClIUGg38ISJGUoceMmieL82oSQQ/2qW/RvxPF4aHgkNF7EKlp4RFVfZ8UmSKDreHCGeC1c3E84BkujmmSJHFdRY8RnUXdp+htOTwwoTWT+Qkd9t1/ivHjTLvpRQmO2st2FMA4wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528517; c=relaxed/simple;
	bh=QPF7Zu2r+fCfqNyJkt1Bte+V+ziLRm+jV4lSeXPHZEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnxaC2MDXW9eAORQWezfosy+iZCEg342+5zwP5PozvxcHEzZ7FbZP2S9tEm+/uKtEsgXgQ048IP2XjltBsP9wQOwKjsKGJR/Gl1S4Lc7TKs48fn4GCMkqM3q/ngfvwj5Moa3sLjNiPRvZ3Y0Mq12yShKjT5pLimrQlFo/CcNPco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f66.google.com with SMTP id ada2fe7eead31-5f52e500e89so6395097137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 07:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528515; x=1770133315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3iP0W+rICWiFtIz9Lnj4u7VRlu+Bycye5GdS1BEDSM=;
        b=X50bAPMlh44PlND4fuBlZDJ1T7bk3fT5E4/lY8EIDTz7aacNHIPDu9Xc/o2XUlBgzc
         MS+tMcQyqQKifN78cRA3OWl/jFVQdaX5WR2KE3KL5hQ5ml1hQx07riipkN205D8DSKEA
         LNePW3NJST1AEoouBcbv2ZZOavHvArSDWpz2tyzM1XFB808PehwyIR4+CXZxGB6n38qq
         99ofv5qGfX1bK0iUK+afEr+BCRhOPJEy+K63mHJnLmG/ZjmAafy2FzGL2/BtVE9bhtAu
         v+3EM/Cg6RLkNu0gyNVIXn0eVp9rAwUkaToYSHq4uKZpScqwQHFk1yQbFeFK6fcC4PSm
         vcqg==
X-Forwarded-Encrypted: i=1; AJvYcCUasOTiiUi6yV1Rd30M3v52YTmiK1KqRaxDTo90GqhVjeIddkOYHsJxQIor3cL5KM2WjC0CRvKIq3lHelmGrZ+/Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8bu3JNwh9lTRx74mflHOhUKsz4d+rwUGU69HHYTnfnjgDl3aD
	vR/dfzP63TEKzTc4YANQ1y7gFhgs2PQVNkc87kXNpuSjSjlCZaTJVXMxmaZdBo1gwMrIbQ==
X-Gm-Gg: AZuq6aLj90DmwBrjLCosGJPoYtKYcaIWrEckc2rgVOneG5oTh4Wf4VvufgL+l5WNmq+
	bzz4ecErxGKuIx/RhuQ5Sz9oJr3xIhfUDnlBb2GpG0ZuL3wWv2fknW7ixBE430LjAYigl7r7eMe
	mwRp5G9G4pe46JkIWR8kNOjMvngKG3qydCJbFqUYEy5a0fqe7x1u5zhrtaljHjyAH9jFgje+Cu7
	zTiwew6lZg0vXv9Dr4yRMHflG4RMDkidG4IAcmIeJ4A0mB3/BSEBe1xpuXmOZbpiXVQ2bCwEwiv
	qPX0gfuMss2eJY0ZzDYYlM0IlAjDHtq6Zr621Dcq7dp+2Lhux1H/JzsCN97v2BsB8MBOUhgy/6a
	DPOzsS98iA3jX2PM9t+mYtDfk393eZO2qkzrOKrRgIbwfqstGo5DSmgM3GzCIWSFcpajbQDnuRN
	guP3xukI5pgUTxCI7zYKGelf4Uw7pO5xAtyqAY89evbQOAryLqYQ6e
X-Received: by 2002:a05:6122:8b0e:b0:566:2302:f317 with SMTP id 71dfb90a1353d-5667960ad30mr762872e0c.20.1769522553561;
        Tue, 27 Jan 2026 06:02:33 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e2ab629sm2359897241.1.2026.01.27.06.02.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 06:02:31 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-566390e7db3so5484391e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 06:02:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9fJNqtJC0z+U5+pN7NBvvKZdhf8Nvft3RyNQxFYRpvcGd+KG9nzOgkIf4NGeO8s6vOd1JOck93YLGvcK2atEO0w==@vger.kernel.org
X-Received: by 2002:a05:6122:340e:b0:566:2568:df1b with SMTP id
 71dfb90a1353d-566794c0a54mr742458e0c.2.1769522547250; Tue, 27 Jan 2026
 06:02:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
 <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com> <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
In-Reply-To: <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 15:02:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
X-Gm-Features: AZwV_QhN9K-WsMdmqL2nfJrvZ40lsYIN6kZoo7JRPE4M6cKNWw4lsg30FvWZJqY
Message-ID: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-27485-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,linaro.org:email,0.0.0.0:email,mail.gmail.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: BAA5B973E0
X-Rspamd-Action: no action

Hi Neil,

On Tue, 27 Jan 2026 at 14:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> On 1/27/26 11:20, Geert Uytterhoeven wrote:
> > On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> >> which connects over PCIe and requires specific power supplies to
> >
> > Here: "requires"...
>
> Sorry I don't understand

Please read below the continuations ("...") below...

>
> >
> >> start up.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> >> @@ -0,0 +1,55 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> >> +
> >> +maintainers:
> >> +  - Neil Armstrong <neil.armstrong@linaro.org>
> >> +
> >> +description:
> >> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> >> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
> >> +  four downstream USB 3.0 rev1.0 ports.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: pci1912,0014
> >
> > Just wondering: how does having a new driver
> > drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
> > compatible play well with normal PCI discovery and probing of
> > drivers/usb/host/xhci-pci-renesas.c?
>
> In Linux, power control is implemented as a platform device driver,
> so it doesn't collide with the pci driver.
>
> The pci driver won't probe until the device shows up on the bus anyway,
> so he power control will attach as platform for this purpose.

OK.

> >> +  avdd33-supply:
> >> +    description: +3.3 V power supply for analog circuit
> >> +
> >> +  vdd10-supply:
> >> +    description: +1.05 V power supply
> >> +
> >> +  vdd33-supply:
> >> +    description: +3.3 V power supply
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >
> > ... but no power supplies are listed here? ...
>
> None are stricly required, they can be supplied directly without
> a passive regulator. Not sure they should be required

So the goal of this binding is to document the required power supplies
which are not required? I am confused (but that could just be me ;-)...

> >> +examples:
> >> +  - |
> >> +    pcie@0 {
> >> +        reg = <0x0 0x1000>;
> >> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
> >> +        #address-cells = <3>;
> >> +        #size-cells = <2>;
> >> +        device_type = "pci";
> >> +
> >> +        usb@0 {
> >
> > The actual DTS uses "usb-controller".
> >
> >> +            compatible = "pci1912,0014";
> >> +            reg = <0x0 0x0 0x0 0x0 0x0>;
> >
> > ... also not in the example?
> >
> >> +        };
> >> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

