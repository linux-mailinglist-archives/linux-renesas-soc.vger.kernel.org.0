Return-Path: <linux-renesas-soc+bounces-19708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9FAB13710
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 10:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043753B6D46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 08:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727ED22D9F7;
	Mon, 28 Jul 2025 08:56:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6554C6C;
	Mon, 28 Jul 2025 08:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753692993; cv=none; b=hKXVkAnr7KxQuUjS9mZCK3JiMtowEYZTZFyMYmCoyObYDl9lHVAsHwk+BLPGUzWe75lvh65xxuOQPPRp/8+DIf+FJL4BdkXi9CxEZPIoO3hSeUTBJ8rsIzk8uMFZYGugws9tbTqlX8L3OpFKA5NbY8LNJDjvazgG0KxBqe7IVms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753692993; c=relaxed/simple;
	bh=qN/u6PndEBo0zcprrAbjEabx1dNlsBZarLJkYS0zCDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbySThLLYtQItDk/bF1DOT28PPhI/zJhc4NXDyRRWiZBFeVSmTwpTHcDQPaJw7rYZ8C+yzREwcgCqiXsp3fFhEW+rplsJc4K7khxI6tOHYorAGg6WVeVj1ceP3inmWREDqNCQTkWmijyc3iDn3n09rxN1Lhghpak5/NmyMvCn8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e8135adfccso1315521137.1;
        Mon, 28 Jul 2025 01:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753692990; x=1754297790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OXkPqeczMASzZj9IrcbhthBG0cCCHz+IouD66QuiFU=;
        b=j460hDjYLpuB52W8sWHFU9d8JBjurcM7ZNsj6jvZfaHA+VEmWI76QEa4/nQOu5qboi
         1uURTcCAYI+b5Huodag2FG17npO627uAWGG15jLGspfyHfKohejKIMrMUg1mNDCqMwm3
         xyPjGURnRVV0SZI4KWTg+o9tgIyXEuR5Py35AgKSfmdDQU+xhejnDMWE1tRYiRohLa9P
         z3f32L6CfCnyS+sNAWKghvqvl1kkuHQ9AEuwuyGopPSqAmaVfj3PwwnbWsc+uFPd1BmN
         Aey0T8I0XPt8T20Ub48rxbx83KynUOrWS5uNz/Eaao4Od26WiiZ64sBBaQfd237N0BaR
         nEbw==
X-Forwarded-Encrypted: i=1; AJvYcCVCeKmzRJwjAVGKicCbj1y1Kci9pCvhD4ImZmDr/mQ5VqSgjGlhn/vnIz2xsRNE9sEv7QNBWGCHBbZQceld4ibZvxc=@vger.kernel.org, AJvYcCXpeQ9iz7bK3eeYX1GzwBq9OQgSHpmhMaJP2SoCkbra3lC6+rtPdkshN7tBrqAJ2zmu0eqnmT+c1Ix+gSw=@vger.kernel.org, AJvYcCXsr6hIMqsETq4+hUINPfczK+BmEbMeUp7TZXIZj5Kj/cjv4mtBNfvd7v0cM/BP1G/Z1rgcA4DbCvoW@vger.kernel.org
X-Gm-Message-State: AOJu0YxHdpIGYpbh3gVqqEgy32qFrXYP3bA8g2uBD5m48i7Hi6CQPn4m
	uSXnXSEHC4qDWb2CUX7bnetryPls9U4L8EXwzLcoaDJP3Vc9wrwy4X7zFRwn5gx4
X-Gm-Gg: ASbGncvNCVNn6utWz4w60RUXsoAxQ25QPBcw8JntJZNNx3e5n9G6tZN82s/Fu4J9gXG
	rkqwPo/p+oTQCW5tQHg1RXDaMdrDJsaXd+kNf6K6X5k4BuAXV/JU/UFPtF/JYGcKripY8P27461
	dYd4b6wVC8KsiCKKyQdm152WD7qQnp7aYJg5EbsIOgcYiMp53+AMNrJu8rhjU4tyaMotqqKmrOx
	w63DcGnpAH8N+GLZ32vYz9MPDNqMQnO3D7RqmnPwCD+kFBdVgs+LHmV6Osq6LZH8SzPtLjj3jlt
	OawpElJDJOALD54/Y452hbA0utZ0L/p/s/6NPdylDyyTP7t5dVU70g/Wy9OLqvI+0yyopk4UtlX
	JgFiubNSDkZZmULwzft18ondoOv+Nx+4l4cgb6xkRiHHSo8hpqzs9ppytmUpj
X-Google-Smtp-Source: AGHT+IEkHNv0DO5DfC6qk4oX32RAlUqGhCVlG/4DQTl0VoNKU+8hB2h9w9YdEVoL2/4nwvqOm/2bXQ==
X-Received: by 2002:a05:6102:160e:b0:4de:d08f:6727 with SMTP id ada2fe7eead31-4fa3fc4c897mr3768174137.13.1753692989967;
        Mon, 28 Jul 2025 01:56:29 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88b8dcf7645sm1241734241.20.2025.07.28.01.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 01:56:29 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e8135adfccso1315514137.1;
        Mon, 28 Jul 2025 01:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBurErtr4WfJb55cP6+POj2thSguEt/4Jz6giEcNI4aH8cMqEot+CJqgComti370JtwqVdU5hMpXCe@vger.kernel.org, AJvYcCWCi59m8ak2w7nMl3MctDz9UZEhenpJSoGnZmwypzAtKLMyU+0hSShvfelDnqc13eFBBdbI9eNwPxnsGB4=@vger.kernel.org, AJvYcCWHwqgfCeU+/6CGmmFDXA2WEkIHJIGszpk2IbXk/B1hePx54eMeX8HgKRiuDVclOy6yg+NO/6UjxBsVcw6RK//SaTc=@vger.kernel.org
X-Received: by 2002:a05:6102:2b88:b0:4e2:c6e4:ab1e with SMTP id
 ada2fe7eead31-4fa3fa713f6mr4025248137.7.1753692989166; Mon, 28 Jul 2025
 01:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724092006.21216-1-johan@kernel.org>
In-Reply-To: <20250724092006.21216-1-johan@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Jul 2025 10:56:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0E_d3XMj6sDeJy8P_UL7ua-_6CnTYqvf2-TD-WXiR3Q@mail.gmail.com>
X-Gm-Features: Ac12FXzigXzLEEByExo9veTydL_Yz5MWFF66kC_gKPBrr86D05FC6p_RGKNNTnU
Message-ID: <CAMuHMdU0E_d3XMj6sDeJy8P_UL7ua-_6CnTYqvf2-TD-WXiR3Q@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: drop unused module alias
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

Thanks for your patch, which is now commit 7b4b5591d4551efe
("usb: gadget: udc: renesas_usb3: drop unused module alias") in
usb/usb-next.

On Thu, 24 Jul 2025 at 11:21, Johan Hovold <johan@kernel.org> wrote:
> Since commit f3323cd03e58 ("usb: gadget: udc: renesas_usb3: remove R-Car
> H3 ES1.* handling") the driver only supports OF probe so drop the unused
> platform module alias.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

While I don't debate the actual change, I would like to comment on
the patch description.  The driver only ever supported OF probe.
The call to soc_device_match() was just used to override the match
data for quirk handling.

> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -3024,4 +3024,3 @@ module_platform_driver(renesas_usb3_driver);
>  MODULE_DESCRIPTION("Renesas USB3.0 Peripheral driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>");
> -MODULE_ALIAS("platform:renesas_usb3");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

