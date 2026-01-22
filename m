Return-Path: <linux-renesas-soc+bounces-27275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN4zKIT9cWmvZwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 11:35:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 118706553A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 11:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA9BD881C56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ED73385AE;
	Thu, 22 Jan 2026 10:25:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD4833509A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769077514; cv=none; b=Hg/m0lgtFZc8oYbIzhRKAS8hhRMJKC3wNmGpZF4cNjllCVWy/yWg+NItFipD0gu+ug6CZqZjgEJU9MHz/hHdNt3aDsFFkn9RqPewwL68uVgvZiPenRiVwKWU+EtgeptcCSKinkMnINBbEz7QgKxUvvuYtS3TTwN1DuxS+rP3Q8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769077514; c=relaxed/simple;
	bh=tzCu6s+P00F9BxBbrZV8bsVUzyJIUMZRriM+ZWggqa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eOyEqS0ZhskXQwY0s8eNpPQFOtBveFU6QatbAmYPNAKj0Fop4NLs6k8kVny1Mw2jQiB8/hWxiXD+4JtN4monM8czncwR1REZNUg75XKfnCm2DZqmaHyaHc/DD3AuM+8L+swQ9/Z7k/FAXMDSgxKxU90+34b3TdhJt996NxBJMBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f193.google.com with SMTP id 71dfb90a1353d-560227999d2so305105e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 02:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769077511; x=1769682311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU8rGFe6B3mE/xdQKQTWoBiiNLtj1+ih/vdN/GH7wsM=;
        b=tImqTf4p9+DDsJQ8DksuahF5K0I78GRoPfdGVl9WLriV0D8516efYiAO9O9OG1XoLT
         EenIVTkjcOFm8lJVBDflxOqGGG/1uKP4Z53FhlxDzQwRevN99KYVxrjmwIM7AxQwi4qE
         hG1QRepBXeNBXpaHWQOmSG+2HUbyhuWvPvf+kXDZ5tLRW49czJbmyKmon6A3kyynCgCE
         4R6lSH98BKn43AaW82lFHLGEv6HJhFHRo182rMCt6DLcN2qN5sQA/ebKMREF1eMdhDZQ
         f4eXuDDx2t8T33cPks/90TnrySX/JpG6qSYnueshQRZ4G5kOBHckgTRGyr1TO9LXfAGb
         MnnA==
X-Forwarded-Encrypted: i=1; AJvYcCVRIkVqdqiikT3YRsNBV2FIk432P9iyLGv7ezvPyGqJW3S/INgUOeSP66ZmBe1iKePo4XYRVqIfL3LszY1vfRBv7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvEYKIlP6pV5qUhMgU3VHL+pzdX8pvTQtYnsVSU+jbaunrC8zw
	m2hHK7+hnolHqx+6VQjP++M1jvVKJWBvUlP5qc8o33MwjcPgze/Noj7jK+LlcN9t
X-Gm-Gg: AZuq6aKenPqWp9o5PH6y/WUP9Xvxd+Hlw/Jddu3x2c5qUsVVTT9M1LX0FzbxGfD+Y/X
	j3nYc+wrZWGXj1Wyg2dTPqvw7w8hXQNy7ax//x5r65DrwwaKmMPLxwwSH9G0IlZ1KT7c3M9prT3
	fTsTJYRCNS/+UeOrgvl71PybFF1/aFzX1Ta4QNfGtMyZ68mR5ljkTuFK1NoNMSaYOG/ovocTuQk
	iv/lUoDY06TyuPMC+db9Lgjq5FdcLXzmRtzvqlgPYRMnVG8syVsYEnfr55UuO0cZYil/IJaKG5H
	Aj9X2QQRGa5QhcNxaxo4UgpbAhkjXuCHWrFxkeyB822Ceovcu34UgbhA4rPIIXzqBW6WTYy9yEe
	JHehYuWq5ypxclUGFZrDxlNpniTdhZmq5ceRzy9zAEx06yG0wylkg1dopE3iyrvZYX5oZQxX4MB
	anLkyIH8hwZBD/J0sIH2AXTg6OYt/6bBfxVb25zQgHl4kdb9Jl
X-Received: by 2002:a05:6122:1828:b0:558:251:f0e8 with SMTP id 71dfb90a1353d-563b736b4a0mr5642139e0c.11.1769077511234;
        Thu, 22 Jan 2026 02:25:11 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e6042sm4424246e0c.10.2026.01.22.02.25.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:25:10 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-947fea7590cso218984241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 02:25:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxGBq/wOmXA+jC1bpOoH9yc3Gq/T00aaMoVEkD4UzTlLhRt8dsNdOB2sVV5J1DWnQOJVUn4WQoF49rwZ6bv1UZlg==@vger.kernel.org
X-Received: by 2002:a05:6102:c8e:b0:5f5:3826:3cfb with SMTP id
 ada2fe7eead31-5f5382646b2mr467462137.27.1769077510009; Thu, 22 Jan 2026
 02:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
 <20260118135038.8033-10-marek.vasut+renesas@mailbox.org> <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
 <6f817993-1b4a-4600-a771-d6c25efc668b@mailbox.org>
In-Reply-To: <6f817993-1b4a-4600-a771-d6c25efc668b@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 11:24:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0iuyUhGRPFf4x==e_ZEMjaB_dP6mrM81F+yxqwam0FA@mail.gmail.com>
X-Gm-Features: AZwV_QjuP8FSEPCU0Lg3L4U6GH5gFTYqAWXZrFYKPuIZu4sDlAHvOrdK6rQ4B2g
Message-ID: <CAMuHMdX0iuyUhGRPFf4x==e_ZEMjaB_dP6mrM81F+yxqwam0FA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27275-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mailbox.org:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 118706553A
X-Rspamd-Action: no action

Hi Marek,

On Wed, 21 Jan 2026 at 23:44, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/21/26 2:48 PM, Geert Uytterhoeven wrote:
> >> @@ -871,7 +902,19 @@ &usb2_phy0 {
> >>          status = "okay";
> >>   };
> >>
> >> +&usb3_phy0 {
> >> +       clocks = <&pcie_usb_clk 6>;
> >> +       status = "okay";
> >> +};
> >
> > This does not work, probing fails with:
> >
> >      usb_phy_generic usb-phy: dummy supplies not allowed for exclusive
> > requests (id=vbus)
> >
> > Adding a fixed regulator that serves as vbus-supply like in commit
> > fec2d8fcdedaeeb0 ("arm64: dts: freescale: imx93-phyboard-nash: Add USB
> > vbus regulators") fixes that issue (and my USB3.0 FLASH driver is
> > detected, yeah!), but a more accurate description would be better.
>
> This piece of code in drivers/usb/phy/phy-generic.c [1] shouldn't fail
> the probe if "vbus-supply" property is not present in DT. If
> "vbus-supply" property is not present in DT, then
> PTR_ERR(nop->vbus_draw) == -ENODEV is true, nop->vbus_draw will be set
> to NULL, but won't encode error, so the dev_err_probe() won't trigger.
>
> "
> 259         nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
> 260         if (PTR_ERR(nop->vbus_draw) == -ENODEV)
> 261                 nop->vbus_draw = NULL;
> 262         if (IS_ERR(nop->vbus_draw))
> 263                 return dev_err_probe(dev, PTR_ERR(nop->vbus_draw),
> 264                                      "could not get vbus regulator\n");
> "
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/phy/phy-generic.c#n259

Sorry, you are right. I missed the PHY driver ignores the error and
probes successfully, and thus didn't bother doing "echo ee000000.usb >
/sys/bus/platform/drivers/xhci-renesas-hcd/bind" after /lib/firmware
became available.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

