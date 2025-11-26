Return-Path: <linux-renesas-soc+bounces-25147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F31C8889E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 09:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 141104E83D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 08:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBDC2D4B6D;
	Wed, 26 Nov 2025 08:00:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEA9125A9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144027; cv=none; b=gyYP8mHq2kPKSWUq6keJY/AinDxP3Gmon9UEIcIdhb82ZtuiPWZRe96Gs608STEUivW+XSTzlx7roL8S/KUh911mAq62L1As/wglawHwXS9UvGZ0GYjyOI/dtBssC2xWdonjDviMyITb9yEJeYlXrbXyqkISlUsag+2TTfBzbEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144027; c=relaxed/simple;
	bh=HNi1fv+2fx2B8j+ekndM34eFcpXdrmRxoHpcjsDW2FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYj4jrMgYBN/G2JvUypatAB+UTrAVTxDv2Xx1Ua4lUcsL7Fd5UElJZdgWIdt8n8DRAzcn5MRm/Ocqf3jtKYomaGDH5R1fB8ceKH5oj061RxBq+h1RT9AOrMsr7AEtdWmnGJ3ylZ6/M7hZhgKFXi0T7Zq9kQwomNf7eN+Getw/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5599688d06dso1693942e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 00:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764144024; x=1764748824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCse7qCPdoJOLa+j8CcQsY7/CoYHUIpR0OYu1ViuPxc=;
        b=fWDtn0fPlUF6mj7p+8seAQKHtgBMJRAf1mgUSaUv5jr7CeXvIJAszhm7U+y0NyIRfc
         eGBS4lVMfY8AbM9bDJyOUQFooQUCS20HDQz1b5hIHZi492Vzjx0Blmy6/7vkiPTj5TR9
         lmU3SYmsnfsROjv0iycf8zrA8XeteaAzLGd2uOah75bDftNRDPk8qxvEjm37G6oQ/H3c
         n5WhuCc3+gBzzZayz5Ygo5u5VFnNnzvuonTStXQZDXcc92XUm+d+28+E0Go64H+tR7Xr
         7AxTQPl+KkUw2/YHM+mWEhNKHw/pHdHtUymytbX5oVXY4dpIIpSZC5amWN7Q3LMW6f1N
         x/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHshrNOJuSfNnZKWLszH4trg7SffE+XhVVlEfxgb4yPe6zOJPF7FlXKW2gUXQ5OafdLEWw50LE2OMXGTur4w1KBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjz6eHWaXeQ+sG2Nv1dNpKeIHXNdKPcLPAQlZ15G4KS+Jj3nxo
	5NoJGBNcF+cbP16tLzu9hZjQObWUxaox9e87OgD4O98liRpz1MdFGPi0UF4hfuth
X-Gm-Gg: ASbGnctA8x4f+foAXHjr6iyiMQK0ItW/GmH8dwEnwEZuzaPXJpYb3wMwhBE9gOuqYPf
	nXnOkUZUeThLln7x1u6XGuDNzcc/vFECx9Xb+TJoDE1MKOfXUw7w6eaCq2FBkDeNUR9J3Y6IRC1
	IzdxDVd5RcEfLZJeUkfwPErOIqlLfgyoMZ6NWP66ERyc2x8RXLwpEp2sOJPycdQONgqhDRwLvts
	3vzV6Qh9/LCsQltquXoqmvDlwY99h+/g9/2dV9WkKzXkQAj/GqxmiPcaOtMp9oVRusxW86HbddZ
	8pxKfaHqINuuTMuPY6UzAx+iU0OhHdyp/UHpTDi8PCs82ZdkwAfPhsvHr9OBePG5Mfi3ONpzxVe
	z4p0fp6IiELZ+L9V5JA1c0j3dd1iF7X90vGmJpExJDvuN9RmMWu0RLuhvZfHXAr2vf26plHt7Cw
	o7vZymWgvJ111O9DwY7AlwzhVdEwmz5Dmd7H+U2gvXlW8v2dc2
X-Google-Smtp-Source: AGHT+IHSzPZuKE1IIRKVp05G2KcgfY9M9oxO+kzcF69agz3ESxJrxu2N7SK/adOX7OeTFuD23BrkIw==
X-Received: by 2002:a05:6122:1829:b0:55a:2b12:8022 with SMTP id 71dfb90a1353d-55b8d6bb6aamr5307084e0c.2.1764144022830;
        Wed, 26 Nov 2025 00:00:22 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f6017e2sm8291490e0c.5.2025.11.26.00.00.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:00:22 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93516cbe2bbso1812649241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 00:00:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSwM7/gjcLwosIj8OFVR/QQb832/t86bNOHcRLbni+lE0wrc70U1TCU5mD1btabzHgcGg7U2zwUAKKVJeDZjIb8g==@vger.kernel.org
X-Received: by 2002:a05:6102:5107:b0:5db:ef30:b74f with SMTP id
 ada2fe7eead31-5e1de0c07b0mr5210199137.8.1764144021094; Wed, 26 Nov 2025
 00:00:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com> <20251125150632.299890-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251125150632.299890-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Nov 2025 09:00:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVt6usA9DvzpzKz7OHYppuFH=jWGKRMqEPDzeoUyTXSw@mail.gmail.com>
X-Gm-Features: AWmQ_bnOQjOc7nJK151W-GJheTjV2TvfMTas4-rqaVdq0WY_ea4kfE0DIGYgMyI
Message-ID: <CAMuHMdUVt6usA9DvzpzKz7OHYppuFH=jWGKRMqEPDzeoUyTXSw@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] serial: sh-sci: Add sci_is_fifo_type()
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 25 Nov 2025 at 16:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add sci_is_fifo_type() helper for SCI operates in FIFO mode to
> simplify the code in probe() and remove().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3546,6 +3546,12 @@ static struct uart_driver sci_uart_driver = {
>         .cons           = SCI_CONSOLE,
>  };
>
> +static bool sci_is_fifo_type(u8 type)

sci_has_fifo?

> +{
> +       return (type == PORT_SCIFA || type == PORT_SCIFB ||
> +               type == PORT_HSCIF || type == SCI_PORT_RSCI);
> +}
> +
>  static void sci_remove(struct platform_device *dev)
>  {
>         struct sci_port *s = platform_get_drvdata(dev);
> @@ -3556,8 +3562,7 @@ static void sci_remove(struct platform_device *dev)
>
>         if (s->port.fifosize > 1)
>                 device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
> -       if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF ||
> -           type == SCI_PORT_RSCI)
> +       if (sci_is_fifo_type(type))
>                 device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);

I am wondering if we could just check for s->port.fifosize > 1 instead,
and thus combine with the above check?  We do have to fill in .set_rtg =
rsci_scif_set_rtrg first, but are there other hurdles to take?

>  }
>
> @@ -3918,8 +3923,7 @@ static int sci_probe(struct platform_device *dev)
>                 if (ret)
>                         return ret;
>         }
> -       if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
> -           sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI) {
> +       if (sci_is_fifo_type(sp->type)) {

Likewise.

>                 ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
>                 if (ret) {
>                         if (sp->port.fifosize > 1) {

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

