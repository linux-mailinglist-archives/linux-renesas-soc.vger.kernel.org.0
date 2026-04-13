Return-Path: <linux-renesas-soc+bounces-31233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA52BYvE3Gn5VwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:25:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F318E3EA998
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8577C300E284
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E3D3B19A6;
	Mon, 13 Apr 2026 10:24:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED0350A0F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075889; cv=none; b=AEzRMhcphrk5RVChYxBsQ+rEpzne4BeKD2Gpr8NDiTBAFsIo6OoRPqSTEr4bbsjpvrqfh1OxCGrIiydxGmvvqJFS6MH9JWInIt46lEefNh5WPOBQgMY2j2G/N7qgSDOvpjXL/KeOHPTw1W4jIngDvFcuQzvDp/vyh2vKDEFBs2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075889; c=relaxed/simple;
	bh=Eor44UFAH5H4RemegiLZ43tjKUuq5dDu3O+Ni5StuYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZ0LXJj0YvoNz3GS85Zh7g2jL5cJAy0+q08PQUvBft7s6UtcNepSGOReK68r1A1GLSMHtzpDQ5d2l8WKveFVJABPhZ6rRrw5NuZtIJ0G7OFankJgd2nlk19MnKTjz9Lp5Z22wkKpWi0DFzNrM535YNonuS1EZiiqEI0Zk8NQM40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d933b555cso1539873e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075888; x=1776680688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w4KUBtrImslyF5rFkM/EbkpM7rzbhtbeCUUEpWux9yA=;
        b=dOCJBUUOSYK8iMkYg+//iTi61P72EzvJjFTcsopc+s0TXHfl1FqgoTz9MdYd+DB7aO
         1X7tt8u3jzfHDRIraTPEHpANIU6fcckNOieq2/oC14cQUUVu2qDvXfxz6RJNsImSoAUp
         71ujw/Gb8HuTfAGmNnayILTtrNq5oJDmSnun/hakjAi6bkxi720yZNB+Ufaik6o4Br58
         2lXQuPkBpxo0XuEIdx9VEM8R/nMnwa3AL6fkwT8WoMOgaU+dNPj8Sl/rNkBYCYlD1JoW
         5/BTuFlqd0ZmPMA4AvOfcwokxHvN9thEYrXHloZy7wc0UIuxuU4mo09Sv2M+6YNEDbDK
         WZEg==
X-Forwarded-Encrypted: i=1; AFNElJ+KB8pWsG9i4+IvTlWyPIcTJw1loZ2I5tWxdQY1o7z54y99hP0coZUQkLM5NN6hUo3eEo9t+ND6xK1gJ2hr77OgVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsf1axg5K5TqguPRrvjwXeVVrM+BlsFEDJVoxP+8uXtQ7uUVoi
	S8oylrXQXx2Ful/8Ka2XJNcJRRi46nVu1MO1vHrA6/sVqj5WHWrs/bcEAcD6P8X2
X-Gm-Gg: AeBDievxEtkU7RQ+Lnse0NJQJx5lSBZo/Nv1hKrCPigEMqmLE5tEQahmXk8vjwc3G6a
	tL3uuOBwAe2huO6lEdK2Rn8dYCxWpNnCcOQjsQtXiUMNIBOWUia1cTRHGUtma8vnTVXV2s6xaUC
	RbrvPzZrCTEMN2PSf8Eh9PgkawsOZD0gWmEW/Cb+QLV8a5bzc2Yc6S01V9zc48ogGqzVhtplTep
	TFffctwMVZ/hRqk7M0ow0NCY1jblaFyxA3x5lLAgI0llU/2qo+WtnfyD7bQVyggUttF6oWb9eKc
	azBBiaEPDg+VkZgyDx+yNXwWDD5HAdY/jTOejEZb3Mxbe0O8RcNCmWVCrKiBio4agIsrgQRNT6C
	8mbD4h8LjdpXCBAO2q3Ss0mASmzFQ9aMwt+e+MYfBzHPEci457ZbX7rYzT5z0IyIeZ9vwtgC9KP
	Xz2+Hn3fNJbcRmfY+XC3lC4qXuHUNPMvayuJkKR0w3bU08YiBJHM21LUAnL538AhG+LkuLFoc=
X-Received: by 2002:a05:6122:4882:b0:56d:4511:936e with SMTP id 71dfb90a1353d-56f3b9abeaemr4948840e0c.0.1776075887704;
        Mon, 13 Apr 2026 03:24:47 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f3b999c29sm6744887e0c.13.2026.04.13.03.24.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:24:46 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6058a7dc4ebso1153922137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:24:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/shcDkiCtKhfCZQGxAS3H47F15y5PmCZfCzisvaq1ANso918xG1FuDyKzAMorCLaefl2GGq7+ymbPzh8XbLnjvSA==@vger.kernel.org
X-Received: by 2002:a05:6102:5708:b0:601:f386:9ed2 with SMTP id
 ada2fe7eead31-609fe89d49cmr4547894137.7.1776075886054; Mon, 13 Apr 2026
 03:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
 <20260408142105.310210-2-biju.das.jz@bp.renesas.com> <20260408123039.922a75327fd7672df3bd61da@hugovil.com>
 <TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <20260408125142.24cd94f094ba3ca512e7f346@hugovil.com> <TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Apr 2026 12:24:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW770zLQt5NiUZffhg3ztXzvM8iT=byBzKJEU9Gm8OykQ@mail.gmail.com>
X-Gm-Features: AQROBzDBodXP0e_hAmML3Ltl4OzkR-OaOnhBTE3J5of60uPbdsEAiAqntLXmLgA
Message-ID: <CAMuHMdW770zLQt5NiUZffhg3ztXzvM8iT=byBzKJEU9Gm8OykQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>, "biju.das.au" <biju.das.au@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[hugovil.com,gmail.com,linuxfoundation.org,kernel.org,bp.renesas.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31233-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bootlin.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: F318E3EA998
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 8 Apr 2026 at 19:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Hugo Villeneuve <hugo@hugovil.com>
> > On Wed, 8 Apr 2026 16:35:44 +0000
> > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > Biju <biju.das.au@gmail.com> wrote:
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > uart_update_timeout() computes a timeout value by dividing by the
> > > > > baud rate. If baud is zero =E2=80=94 which can occur when the har=
dware
> > > > > returns an unsupported or invalid rate =E2=80=94 this results in =
a divide-by-zero fault.
> > > >
> > > > baud is returned by uart_get_baud_rate(), so this is not returned b=
y the hardware?
> > >
> > > You are tight, Will update commit description.
> >
> > How can uart_get_baud_rate() return a zero value? If I am not mistaken =
even for the B0 case, it will
> > return 9600?
>
> As per the comment and code, this API can return 0.
>
> * If the new baud rate is invalid, try the @old termios setting. If it's =
still
> * invalid, we try 9600 baud. If that is also invalid 0 is returned.
>
> In drives/tty currently only 1 driver is checking the return value
> and it calls panic
>
> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/tty/serial/apbua=
rt.c#L214
>
>
> I believe we should call panic, if baud =3D0, instead of proceeding.
>
> Geert, any thoughts??

IIRC, baud =3D=3D 0 can (only?) happen when using earlyprintk on a non-DT
system, where the serial console should just keep on using the settings
programmed by the firmware.  So any config register writes should
be skipped.

On DT systems, even earlycon uses the bitrate from chosen/stdout-path.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

