Return-Path: <linux-renesas-soc+bounces-30183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIS3BdvJwmmIlgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 18:28:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 724AE31A027
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 18:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CC91300F140
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 17:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D897F3F076E;
	Tue, 24 Mar 2026 17:28:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63616402459
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373335; cv=none; b=luUy3jqzS3ZD1M80IdHOjizlbgaNmQoYhu/W1OAGOLImkOT37POT6gR83kQT1uayxBr4DRsFvKhObYoBpBj9wTX3A0EpkVkLQafAeHbM8fw5ySJ10M/d+wz40JAyuGGdt1ADlLayPnsQRjCr6HxSBsrrWfLemQuceceA5G9T1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373335; c=relaxed/simple;
	bh=x2ByeNkouiKEPMao42C6oXqtSEjnJKDNRhIggOr4SeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noKIXlMYXzour5iZ2mrwdjuy70imNJ2jcNDWgV0XkfTkduA4SDfQOHFiq/Q+aYMDAtg/XYj6XEhyRz44X0jgTWKNJ6ewIeDiEKdCc/TmvevdG+ZA4xR3OKM1nRINBbw/60Br7xbMF+z792oQcQziRKdlJdPySWS2Ne1PQ8xNVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so3467293e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 10:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373333; x=1774978133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XpevOJBLVmJEY5vWAghuAgrLubq4HkQJ5E3Owe/CCLU=;
        b=E+1fbarCnRy4DK0LNlU1ROhPQi78lXDgHx8hJJq/z3YowcV+QOjcQz3zSAhSx71a+x
         H/zeJ4DXUv4BQFzGyhk7CC68Z31mVbYh8mXQVRnGxiIXdlJOEl7yH4wcla5e46eVpXrt
         L35a6QipRwK0yGu/C51NYq/RgWI4Dqo8WP8C6MBzQY6dCWLPPr1rRGPcYS96EqI9wZGl
         /UvY5dONKqNILviLfoKOWxBlMrZ0h/dd+4j+pEKCWg9V5UjNU/jLtKZQwC3rT2cXBFjc
         KKNDpYbqaCzNxehuTlbTpk5DgFGa6VwFwGoZjayNmKUFxDLleVWGIhEyPE8AqwJ8r8wm
         Yhtw==
X-Forwarded-Encrypted: i=1; AJvYcCVxfIJqdx2ipzgZoFDNe28PddPxRmh4rDNmuDGu4NTdk8K6oMlkuY5r185SayR/U95KfTfRZRJldQ2S+pzUuJ64Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtaqXBGfLNpc0BXTLCmYFtUf9/OHLaMof4tSG7jnZl1eBAfKCz
	59OAlpPvODot9p1Ic2tkgNYcd3wp5E8hkdy1NGyogHkiTqQXbTK/UlEBw83K0AfsCEQ=
X-Gm-Gg: ATEYQzyQ86FyROtz6bOXXk0FmXT4qm0IEIM8nTDv+/5SwtySAALfist9HRSILKzBs5O
	Nztv817eVCLWauxAl9x/FLPw7I/tbp4jJfKesl1p+qKOOXb9pN614toU2wVCq5ad30tQ9ev3szO
	eHIRqiK/MXpnJgAOwlQaXZh9eLV/5xEGHlPoQ1M57zU5VKGapusqX6/TfXu06gsquwve07dYjne
	fxz8CdUqTAHTKxzeASXmQVBGHe/0Mv1zSEvqHgD6z6GLdSjnRXSGbicPSX0GFy+K3SpSkrck54u
	Sggy4SSY8XWo4cvur0oO45kGc6LINWoXZpJreWyVkYmwmT7t7emlOQUh16qbFAEallRUajjsWBK
	5mmp5sAmxyBdqV4fEc09CSMA+ghVNFBW7TrR2C++KQNPezyywegDTrjRsfi2fHa2rpTc4JkKhC9
	CzcdJEXIvgr6+yaJGCGC2R5S5NPsbCNPXPDsmWPPKV/WyNG1hSj93zGIH3H14c00Ko
X-Received: by 2002:a05:6122:c9c:b0:56b:c6e1:65b2 with SMTP id 71dfb90a1353d-56d21f3d2d2mr435851e0c.4.1774373333228;
        Tue, 24 Mar 2026 10:28:53 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb6cdf8sm15994995e0c.3.2026.03.24.10.28.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:28:52 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b65ffbda3so4121105e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 10:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvG4dZTBysg1KXdLfN0fO2Slj6A1VtYvHofMvSPtz41t6Qgj5C/MYPoFDQIfd3MHcMezrHcY8K+f5sblLa2yzEYA==@vger.kernel.org
X-Received: by 2002:a05:6122:3296:b0:56c:c88d:e8c0 with SMTP id
 71dfb90a1353d-56d21f9be0dmr420645e0c.6.1774373332547; Tue, 24 Mar 2026
 10:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com> <2772d5e1-2127-4808-bd9d-aa40b4ad7104@tuxon.dev>
In-Reply-To: <2772d5e1-2127-4808-bd9d-aa40b4ad7104@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 18:28:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEjMs9TgGR=vMG4Sd_XtnaW+D5Vrb0VBCZdb35TtLXEw@mail.gmail.com>
X-Gm-Features: AQROBzCteidl4a6fS-qPzYwEquSsiUdAXRMvWK12r9jXkFflwuEKzU1olQROBhU
Message-ID: <CAMuHMdUEjMs9TgGR=vMG4Sd_XtnaW+D5Vrb0VBCZdb35TtLXEw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30183-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,tuxon.dev:email]
X-Rspamd-Queue-Id: 724AE31A027
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

On Mon, 16 Mar 2026 at 11:19, claudiu beznea <claudiu.beznea@tuxon.dev> wro=
te:
> On 3/13/26 15:15, Geert Uytterhoeven wrote:
> > On Wed, 18 Feb 2026 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Add GPIO set_config to allow setting GPIO specific functionalities.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *c=
hip, unsigned int offset)
> >>          rzg2l_gpio_direction_input(chip, offset);
> >>   }
> >>
> >> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int=
 offset,
> >> +                                unsigned long config)
> >> +{
> >> +       switch (pinconf_to_config_param(config)) {
> >> +       case PIN_CONFIG_BIAS_DISABLE:
> >> +       case PIN_CONFIG_BIAS_PULL_UP:
> >> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> >> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> >> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> >> +       case PIN_CONFIG_SLEW_RATE:
> >> +       case PIN_CONFIG_DRIVE_STRENGTH:
> >> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> >> +       case PIN_CONFIG_POWER_SOURCE:
> >
> > Shouldn't you handle all types that are supported by
> > rzg2l_pinctrl_pinconf_[gs]et()?
> >
> > The following are missing:
> > PIN_CONFIG_INPUT_ENABLE
> > PIN_CONFIG_OUTPUT_ENABLE
> > PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
> > PIN_CONFIG_INPUT_SCHMITT_ENABLE
> > RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE
>
> I'll add these as well.

Apparently you can't just add RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE
to the switch statement, as gcc requires all case statements to use values
that are actually defined in the enum:

    drivers/pinctrl/renesas/pinctrl-rzg2l.c:2072:9: error: case value
=E2=80=98128=E2=80=99 not in enumerated type =E2=80=98enum pin_config_param=
=E2=80=99 [-Werror=3Dswitch]

As the documentation states this range is meant for custom
configurations:

     * @PIN_CONFIG_END: this is the last enumerator for pin configurations,=
 if
     *      you need to pass in custom configurations to the pin controller=
, use
     *      PIN_CONFIG_END+1 as the base offset.
     * @PIN_CONFIG_MAX: this is the maximum configuration value that can be
     *      presented using the packed format.

I fixed that by replacing the enum by u8 in the conversion macros:

    --- a/include/linux/pinctrl/pinconf-generic.h
    +++ b/include/linux/pinctrl/pinconf-generic.h
    @@ -173,9 +173,9 @@ enum pin_config_param {
      * upper 24 bits.
      */

    -static inline enum pin_config_param
pinconf_to_config_param(unsigned long config)
    +static inline u8 pinconf_to_config_param(unsigned long config)
     {
    -       return (enum pin_config_param) (config & 0xffUL);
    +       return config & 0xffUL;
     }

     static inline u32 pinconf_to_config_argument(unsigned long config)
    @@ -183,8 +183,7 @@ static inline u32
pinconf_to_config_argument(unsigned long config)
            return (u32) ((config >> 8) & 0xffffffUL);
     }

    -static inline unsigned long pinconf_to_config_packed(enum
pin_config_param param,
    -                                                    u32 argument)
    +static inline unsigned long pinconf_to_config_packed(u8 param,
u32 argument)
     {
            return PIN_CONF_PACKED(param, argument);
     }

Probably a few more should be updated, too?

> >> @@ -2819,6 +2838,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinc=
trl *pctrl)
> >>        chip->direction_output =3D rzg2l_gpio_direction_output;
> >>        chip->get =3D rzg2l_gpio_get;
> >>        chip->set =3D rzg2l_gpio_set;
> >> +       chip->set_config =3D rzg2l_gpio_set_config;
> >>        chip->label =3D name;
> >>        chip->parent =3D pctrl->dev;
> >>        chip->owner =3D THIS_MODULE;

This change breaks pin control and GPIO on RZ/Five:

    -pinctrl-rzg2l 11030000.pinctrl: pinctrl-rzg2l support registered
    +gpio gpiochip0: (11030000.pinctrl): setup of own GPIO can0_stb failed
    +requesting hog GPIO can0_stb (chip 11030000.pinctrl, offset 18) failed=
, -95
    +gpiochip_add_data_with_key: GPIOs 512..743 (11030000.pinctrl)
failed to register, -95
    +pinctrl-rzg2l 11030000.pinctrl: error -EOPNOTSUPP: failed to add
GPIO controller
    +pinctrl-rzg2l 11030000.pinctrl: error -EOPNOTSUPP: failed to add GPIO =
chip
    +pinctrl-rzg2l 11030000.pinctrl: probe with driver pinctrl-rzg2l
failed with error -95

For the can0_stb hog, rzg2l_gpio_set_config() is called with offset 18 and
config 0x115 (PIN_CONFIG_PERSIST_STATE =3D 1).

Just adding PIN_CONFIG_PERSIST_STATE to the switch doesn't help,
as pinctrl_gpio_set_config() also returns -EOPNOTSUPP.
Ignoring PIN_CONFIG_PERSIST_STATE helps a bit, but the next call
uses config 0x8, and pinctrl_gpio_set_config() now returns -EINVAL,
but the pin controller now gets registered?...

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

