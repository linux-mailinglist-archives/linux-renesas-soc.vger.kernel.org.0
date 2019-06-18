Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65DE249A82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 09:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfFRH0a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:26:30 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45282 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfFRH0a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:26:30 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so11970508lje.12;
        Tue, 18 Jun 2019 00:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vYL9eXDi5fZpGlVTlm0z+uYln5oEnd9pKK7FianvZDY=;
        b=n77tDDYW3waBJcbaLClbwhgJNVmsfk5FAsDzfvkRtsVYUz5XivzhKWqj9CuUlpxepX
         AhhsDeKwIhTmj1M2+vIu0VBI9tpyT84ZpettpVg5b5qVvczwe1SumgYE8gA+uym9mTYx
         WiCeV2BrHtbwM96rwp0d7AdBxVZNYn9G1PpZHfxJdKa2yk/X0flYHERTJ1HelGEhtHIb
         nHMVUvwNNEHoeooCuNFJtkU8RcwK0zWF1xOQt15oQy3ddnomAbN6T8GX0jaiWjyIyDe7
         YcHTaAww5VHFU6h4lDE42zi28SS5wmCodFXRCbVxXIbTyvWmA+TB9r3oZPBOGHQONGpe
         4MRA==
X-Gm-Message-State: APjAAAV/K880qo/1Myl6mJSYlpkfFw/nKUW9qBJid4a6PyjgFp+xXrhv
        7+/FRFF0nkWr0aN/UM9c/dnQ3SSst/voW3VCx14=
X-Google-Smtp-Source: APXvYqwVwG4Ku4T77iSiLcEDng/rGcmEPe1CG74tXlrwmHFU8f75YYR01E+2/xDuxubK98hEiyqOVhiH+OOF9c18HUY=
X-Received: by 2002:a2e:9685:: with SMTP id q5mr13577892lji.227.1560842788335;
 Tue, 18 Jun 2019 00:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <1560424728-13929-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190618055915.GA5904@kroah.com>
In-Reply-To: <20190618055915.GA5904@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 09:26:15 +0200
Message-ID: <CAMuHMdUjVaRxLKjx3twLqGaL41NeLaxdsKatkRXij+VY+FOGWg@mail.gmail.com>
Subject: Re: [PATCH] usb: renesas_usbhs: Use struct assignment instead of memcpy()
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

On Tue, Jun 18, 2019 at 9:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Jun 13, 2019 at 08:18:48PM +0900, Yoshihiro Shimoda wrote:
> > To avoid the error-proneness of calls to sizeof() in the memcpy,
> > this patch uses struct assignment instead of memcpy.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  This patch is based on Greg's linux-usb.git / usb-next branch.
> >  Note that mod_host.c also has memcpy but we cannot use struct assignment
> >  for it because the type of urb->setup_patcket is just "unsigned char *".
> >
> >  drivers/usb/renesas_usbhs/common.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> > index a501ea6..ebbe322 100644
> > --- a/drivers/usb/renesas_usbhs/common.c
> > +++ b/drivers/usb/renesas_usbhs/common.c
> > @@ -651,9 +651,8 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
> >               return NULL;
> >
> >       dparam = &info->driver_param;
> > -     memcpy(dparam, &data->param, sizeof(data->param));
> > -     memcpy(&info->platform_callback, data->platform_callback,
> > -            sizeof(*data->platform_callback));
> > +     *dparam = data->param;
> > +     info->platform_callback = *data->platform_callback;
>
> How are the original calls here "error-prone"?  Yes, the compiler will
> end up calling memcpy somehow with this change, but it feels "wrong" to
> hide a memory copy like this.

There are no checks that:
  - the source and destination pointers point to the same type,
  - the passed size matches the actual object size.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
