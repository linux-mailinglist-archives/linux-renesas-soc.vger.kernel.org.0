Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9950B140E8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 17:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgAQQEM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 11:04:12 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:32944 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727043AbgAQQEM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 11:04:12 -0500
Received: by mail-oi1-f193.google.com with SMTP id q81so7783895oig.0;
        Fri, 17 Jan 2020 08:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tj0ML7xGxi84YziSNC30JQRGRkF1DzupsBsO/RsmBgQ=;
        b=rfDrZvFDXUlLEyUOirfTujMtIhdEwDq83SBfukZ8yd9Rrj90YZnAK8QcdpD1Sl8Hzw
         g3xRJZCMZtdOIeFHAJfy1rHOt15UUukNOSr67wZfahoAHenTcDeeM13IiueGY7gsWPHE
         SPfR7Sdb09w6wBvd92a/TbXJElefzTABCljYHcJhZDoKl6gCwCxPiKhR5sPAT8JHyORL
         tuayCzz3AVlRTP72huAy/XxmK85YuhIuAET0G8HwGTeJKz2jApYS8ASL84TujSXhXFf2
         0G7QewQw1wxKAnjNakKZNuhrjH+n0PSMvvlPLd4F99MK44qehgnt2Xn6ZdZ88MelDdas
         TJbQ==
X-Gm-Message-State: APjAAAV8OrQCrinoVJAUq49Jt8Akg1DQjSXccXtvYUWPtpMGKu/1Qm4r
        l7HClrC+iUTVUq3A5W5FAMKWDXpMfieaJDjBhnoOcQ==
X-Google-Smtp-Source: APXvYqzxqd4Y74jdhDHNQCal/fsnNKYM9n701II2rxK4VZrYeWXtoi1t48vPdbAjfcW/vr1RuXxzg4gqDj2yMvO6leA=
X-Received: by 2002:aca:eb83:: with SMTP id j125mr3733096oih.153.1579277051647;
 Fri, 17 Jan 2020 08:04:11 -0800 (PST)
MIME-Version: 1.0
References: <1579258447-28135-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1579258447-28135-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1579258447-28135-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jan 2020 17:03:19 +0100
Message-ID: <CAMuHMdU3SyOTSt2E1JkZsTbqfRgCOSOWrugd4uhmJ05p+azwYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: generic-ehci: add a quirk property
 to avoid stuck
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Tony Prisk <linux@prisktech.co.nz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch!

On Fri, Jan 17, 2020 at 11:54 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to
> be getting stuck very rarely after a full/low usb device was
> disconnected. To detect/recover from such a situation, the controllers
> require a special way which poll the EHCI PORTSC register and changes
> the OHCI functional state.

Oops... Is this limited to the EHCI/OHCI implementation on R-Car Gen3?
Or can it happen on any EHCI/OHCI controller?

> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -63,6 +63,11 @@ properties:
>      description:
>        Set this flag to force EHCI reset after resume.
>
> +  needs-polling-to-avoid-stuck:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Set this flag to avoid getting EHCI stuck.
> +
>    companion:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:

If this issue is specific to the EHCI/OHCI implementation on R-Car Gen3,
I don't think this is the best solution to handle it.
It might be better to add family/SoC-specific compatible values for the
EHCI/OHCI controllers in R-Car Gen3 SoCs, cfr. the (undocumented)
"ibm,usb-ehci-440epx" and "allwinner,sun4i-a10-ehci" compatible values
in the example in the DT bindings file (probably we should have done so
from the start, like for all other devices).
Then the driver can handle the issue based on the compatible value.

Besides, what about DT backwards compatibility?
To enable this quirk handling, the DT must be updated first.
This is true for solutions based on either a DT property or on a
different compatible value.
Of course, you can always use soc_device_match()...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
