Return-Path: <linux-renesas-soc+bounces-28060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEzBCaDAiWk/BgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 12:10:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B95DF10E854
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 12:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFDB33006107
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 11:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2194E36C0D9;
	Mon,  9 Feb 2026 11:10:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152136C0C0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770635422; cv=none; b=aJx4JjTn/H5xKhLRAlfQ+3vbe3ZwXIy0HYUAjkqoHzFYpqbRXIw9b15jtYVoAlGns92b0LQt2PdhtEjFPnJjlx7xt6IwSJwKh4Yi4e1K9WaLpfy+q50eu0ufq+lYZ7pGvDJS7CQQlkT+VQJWcSWmzq0aeDUxIrqpaBYyjxYaWhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770635422; c=relaxed/simple;
	bh=sC1KLy2SPQ43D9OQaLHsL9GAH/uPG9wpQURfezxkw+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZ4SJ/+fsIhPY+JBznnclTW/gnaImyo2D+8lU2mNHxvl4JgA3KHkJjat6tws4tmWtd5Zx/Lot578lwzRdZF+ayUiWPrjrD/8K8hejJUsZk6IHvAOf4fUAwxZ2oinKNkHoc3COImtVcUXV7/x0Vc47U+hL346jgDHZTg6XonpLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5fae45001d1so2289451137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 03:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770635421; x=1771240221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFhQGFBF0i+66a0TJna2Rm6FRsUIJ3sMEDyWqu3+t6g=;
        b=jPDaQOlPmWr8fzPHrq+I5x82gbe+H8qNznf7JBBLvR+jjNvLYp52xJ49ePsIfgFRZc
         4iaCcidI+a9ArpsuS9jNZstveV4b9l2ex0UN03+G/H2/hlUTKGrLSuW97vxzvYoljZl5
         qlOZCdZeWG8qlk0xUdqHbpAzCiAOwd7KtpCuJnWkHMFdA31W8d9kcXxTdj8vhhu1f2rs
         tFGwj9OeyEVndf0pg0AbxPVAWQUNnDRBf543H5SWfslJNSJTOaft990j8qhE1D9tNb1+
         Qvt5X60mU1G5JtfKELw8Kb9VG2BLUxqttQl1ATWlH3Spe6HOtvccLwot1V4zP0+WNGR7
         04nw==
X-Forwarded-Encrypted: i=1; AJvYcCXW8jacD5E34W/PXlib7m2rK3xRON1iPXVqlBZmO1kaFE+WzhwyIOCcKp4JvC+9WbR/P9dtg+DVshP5SFuWDoGctA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/M/I2AcYuEKgDGjXcsniZRn7hNDj+rY8Hs4fZl/REbQFZkG7
	WUPfgpTdg7GhZhMReGHDJxkbXjBMH6FMpyHhEDbAGlun29tJ2rC4wtMcfTWSwLUH
X-Gm-Gg: AZuq6aJ/Cxdd5ZzT/ZU/wAkevhMNRxrVX3PpMSujig586yG3vpK13Y/eTkp66hM30lI
	RbXQ7rWdMY3lIoVjB6t05ykdvEnNjnDWDOZeBUklweDn9dQrxYlNMeTDXdJei3uCcZsZlZ5V719
	hVg9/OnuEeB8nwuQsh2f+LjvWbgipSVzKiPjLAleQu0etqUkqVOZ7AnYYOjpIsC0ZduMHQFk+Rx
	NnhnJNZGqZnki20LQwvZgWOS9YWbIohfKF/iVh6jp/aiTunCj1cpMZTA+35uLt8dejmWhuqqshK
	RGKBihv2sgSqfrIbJUDs10yWmfF8Dh1HTr4yB0U3Du2wzWf+lJ3vIAJ7HkOfOwl3sfTMwkVI1s2
	ymv1YoXH0vMfvSKJ0SA+S1i5O+VHwPLESDU8og8/jeJCh4Orky/1IFIlXbZkPYntpoyqCj8ua0I
	g4DQtaXfHR2JZxL8dF5Oqul439tDEpBTYr4MYTQzxitn5dn3QpPSEY8OK40eBbc8k=
X-Received: by 2002:a05:6102:2913:b0:5f5:33c9:c9b7 with SMTP id ada2fe7eead31-5fae8c90986mr3200484137.41.1770635420702;
        Mon, 09 Feb 2026 03:10:20 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-949014a7241sm3134199241.3.2026.02.09.03.10.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 03:10:20 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-566360cab02so3139590e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 03:10:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZkJc7VXDVCOtc9m6rvfvgXomC4LRYv22p0SiOHfkc8zKkPlxYVrIwQCErNpMdHqHC1WIQ//ordTemRafVGtWnpQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:5ef:ac78:3c77 with SMTP id
 ada2fe7eead31-5fae8aafb2dmr2699695137.18.1770635026255; Mon, 09 Feb 2026
 03:03:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-rz-sdio-mux-v8-0-024ea405863e@solid-run.com>
 <20260203-rz-sdio-mux-v8-3-024ea405863e@solid-run.com> <b7dcb374-b79c-4e9f-ac30-2f507127cfb3@solid-run.com>
 <CAMuHMdU01vwif4H6H-cYUfW0Y56fN6Anp9F4Ru7q3fveNqqoXA@mail.gmail.com>
 <39f3891c-c05a-4e10-9ad4-ab3cbc6fa70e@solid-run.com> <CAMuHMdVbi=2puhk84k+FCDXqkQ9jFsy0rsseQiFCF8i=KsR1OQ@mail.gmail.com>
 <1a4288f2-ee5c-494f-9fbe-ea3a90a16014@solid-run.com>
In-Reply-To: <1a4288f2-ee5c-494f-9fbe-ea3a90a16014@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Feb 2026 12:03:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa6o19+oX=-Hkpx+tEsnJ39vyi91FwbU+YHJqv=QsPkA@mail.gmail.com>
X-Gm-Features: AZwV_QiXoAPXWcsFJ5cXmi5LxanLCRJoL8Hmi_xM0cWtiaFZbVoUaSfpkEx2uEE
Message-ID: <CAMuHMdWa6o19+oX=-Hkpx+tEsnJ39vyi91FwbU+YHJqv=QsPkA@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] mux: add help text for MULTIPLEXER config option
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28060-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.925];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,solid-run.com:email]
X-Rspamd-Queue-Id: B95DF10E854
X-Rspamd-Action: no action

Hi Josua,

On Mon, 9 Feb 2026 at 11:47, Josua Mayer <josua@solid-run.com> wrote:
> On 09/02/2026 12:17, Geert Uytterhoeven wrote:
> > On Mon, 9 Feb 2026 at 11:12, Josua Mayer <josua@solid-run.com> wrote:
> >> On 09/02/2026 10:06, Geert Uytterhoeven wrote:
> >>> On Sun, 8 Feb 2026 at 16:16, Josua Mayer <josua@solid-run.com> wrote:
> >>>> On 03/02/2026 15:01, Josua Mayer wrote:
> >>>>> Add prompt and help text for CONFIG_MULTIPLEXER to allow enabling t=
his
> >>>>> option thorugh the kernel configuration without explicit "select" d=
river
> >>>>> dependencies.
> >>>>>
> >>>>> Select it by default when COMPILE_TEST is set for better coverage.
> >>>>>
> >>>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >>>>> ---
> >>>>>     drivers/mux/Kconfig | 8 +++++++-
> >>>>>     1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> >>>>> index c68132e38138..e31c46820bdf 100644
> >>>>> --- a/drivers/mux/Kconfig
> >>>>> +++ b/drivers/mux/Kconfig
> >>>>> @@ -4,7 +4,13 @@
> >>>>>     #
> >>>>>
> >>>>>     config MULTIPLEXER
> >>>>> -     tristate
> >>>>> +     tristate "Generic Multiplexer Support" if COMPILE_TEST
> >>>> This didn't do what I thought it would.
> >>>> It was my intention to allow enabling this through menuconfig / .con=
fig.
> >>>>
> >>>> With the syntax above menuconfig shows:
> >>>>
> >>>> =E2=94=82 Symbol: MULTIPLEXER [=3Dn]
> >>>> =E2=94=82 Type  : tristate
> >>>> =E2=94=82 Defined at drivers/mux/Kconfig:6
> >>>> =E2=94=82   Prompt: Generic Multiplexer Support
> >>>> =E2=94=82   Visible if: COMPILE_TEST [=3Dn]
> >>>>
> >>>> This means it cannot be selected.
> >>> Looks like you haven't enabled COMPILE_TEST first?
> >> Correct.
> >> But CONFIG_MULTIPLEXER should be visible always,
> >> not just when COMPILE_TEST is set.
> > Why should it always be visible? All users select it?
>
> This is not relevant for v7 now and can be handled later.
>
> It was discussed previously that drivers supporting optional muxes
> do not need to "select" MULTIPLEXER through Kconfig,
> E.g. the renesas sdhi driver.
>
> However other drivers are already selecting it even though the mux
> is optional, see e.g. phy-can-transceiver.
>
> In order to support muxes in renesas sdhi driver e.g., users must choose =
to
> enable both the renesas driver, and multiplexer subsystem via the
> configuration.
>
> The mux core standalone also supports a limited use-case without other
> driver
> interactions, setting idle-state e.g.:
>
> mux-controller {
>      compatible =3D "gpio-mux";
>      #mux-control-cells =3D <0>;
>      mux-gpios =3D <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
>      idle-state =3D <0>;
> };
>
> So it can be generally useful for a user to enable CONFIG_MULTIPLEXER.

Then please say so in the patch description.

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

