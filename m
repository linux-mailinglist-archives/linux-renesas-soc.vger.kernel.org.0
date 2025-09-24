Return-Path: <linux-renesas-soc+bounces-22333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7CB9A176
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F7591886C3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0338D30214B;
	Wed, 24 Sep 2025 13:44:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2DA2D73B5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721459; cv=none; b=XxOmxd9FBXF76GeQ7IYouWnU6B2UtjCiUk4RzA/ioC+J9nxgHinBCUQyPEvwd460YQ2a9Sx99TeCEUMJIcZnFhOdA28SsLbLe0swd80FWsZfUcBy0alym2yStFIwQ6JcQAY8xYTZzUi4DY0u4THMCk8EJ2Q9oV24MfNOak801Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721459; c=relaxed/simple;
	bh=MaTNhkQHyFmJQwS+ctA2quBLbt8KbQCGyEQl3AcBgsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjmNX3VoAxTYVSbh+apKU4CUUjKFbp6Z+e/51HbUlLYsXE+qaY4t+NbfNpQvsvr1ZU3OLyS6XtGahL16NP0ySbNAwWAHWhIqB9flTA47qis9R3A/UzyFbA1l32opb0kfX0H9+ELFNnZ78NK8x/CbTB7wdCm9f118mu6gxyzDkm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8e936be1359so3204317241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758721457; x=1759326257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ud+VdfUL7qeLttCIpK8GnWcnYhqw7mGxqeGHH/+haJ4=;
        b=jiTauWUeRUyJrHsL5VZeX+xxgfUS1xQApupVOn1UODJQdc+PRYAnNoGwFhL+OJRGUz
         MRdyanaUaep7PDyub+GYJee8tXOh5lUw9hSu2pS1+YMALYBI0XGLhmzrMzqsx5NWHpk6
         L7nS5ySv+vzUCAPa0UFIWOdGpdEL+rmLbL+rHXAqJ7Xhd8SMWrVm/EeZxH17xwGjVZNl
         ZBjztGDhXSRn7yHQO6vax1c+x01FYz8aF1MgHcwSROxlql76RYJdeFXbWTUH1jSs5urp
         pyS4/qe2AAO4oLIIRAMQKCrmWibWbffVLq4GOinSQQuKGCyA2etn5UZ5aeU7TS8Oc4Ng
         kNYw==
X-Forwarded-Encrypted: i=1; AJvYcCWRIzOrEmjFtYkl8yzyIKL+UUHu12EzzfJ4UHjILSYELln8Oi49WhKQohBWUhJc1uOUrD8LMDB1KxA+D0HhnaG1ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfnmtnTsVvkwedkYqLR8eOt+7PS13e8GhVT0M6bKnGRF2R+s4L
	/7ln72wsYXm5K/7J1fvhluiRDNu0+fgfsfrvNlXFl+VkZUfS3CIOkkyMH4sfJ+5M
X-Gm-Gg: ASbGnctpPwsh7fQcjHzufvzyWcq8mmPcsGeFfOCcILKQIvKIe2eUEhx4HqhUQ3MpX1R
	1PhbRZZM59tfSf6s54osqHrNSed170MxBLyiNqmF68hxrVHTjYwkuN3KwNmwhTn5q2JnAxwZTJ0
	sShUSsg3e6jJ16QmvreDtKlR+k1ucrpuxREENkX5sigTt62B2kjQPy90YoEmjSkwiCjvkBhJvrq
	euIlXW/gBmC+ypu4MILRlMYZ4Af4JYtEKXlwRJZTosc/0lk7vMUQRMrww4D//LkqHK985S/GMjx
	A4+WMD/DcsmFvuO7Rs03u+2ShT8Xm2kZmmqTNE1pQ8qLdcehE4Q1yxEfqdq0eFJ2Wveqk+BVxpp
	urJhwBDOMEmbxWCI0XGgR+VS11Go8zZZMrhrRLvA1zu7sYv1LmeEKIzEvxKap
X-Google-Smtp-Source: AGHT+IEeJjmJG75ilO96RF0HShaNc02fjnFIiEiSaw/Vq1QeOKUvI74czONESbge/Ty3DhcH7AJD2g==
X-Received: by 2002:a05:6102:3752:b0:59c:93df:4fe with SMTP id ada2fe7eead31-5a5785b8569mr2373169137.9.1758721456729;
        Wed, 24 Sep 2025 06:44:16 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e75260aesm3147966241.10.2025.09.24.06.44.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:44:16 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso417212137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwx9vZfqwHp+NckU5qx7NeBv5O6L4N4VuT/793zSejNveKWI6i7sGQ5VaTIwoHlZexKWQ9BDwuXGGtefKIxjscFw==@vger.kernel.org
X-Received: by 2002:a05:6102:418a:b0:525:9f17:9e55 with SMTP id
 ada2fe7eead31-5a57c841ca2mr2580466137.32.1758721455932; Wed, 24 Sep 2025
 06:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922074101.2067014-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250922074101.2067014-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:44:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKbPGqAnAcL2kFyF6K3hH9=gr8ECAFVpkgj-OL1mB4eg@mail.gmail.com>
X-Gm-Features: AS18NWDtZK7ut054Ynx0fOpihOfMi0d8Hu_LC6xa7NuQxZWkG8VW8DC_8cFyNCQ
Message-ID: <CAMuHMdXKbPGqAnAcL2kFyF6K3hH9=gr8ECAFVpkgj-OL1mB4eg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rz-sysc: Populate readable_reg/writeable_reg
 in regmap config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Mon, 22 Sept 2025 at 09:41, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Not all system controller registers are accessible from Linux. Accessing
> such registers generates synchronous external abort. Populate the
> readable_reg and writeable_reg members of the regmap config to inform the
> regmap core which registers can be accessed. The list will need to be
> updated whenever new system controller functionality is exported through
> regmap.
>
> Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

How can this be triggered? AFAIU, registers are only accessed as
obtained from syscon_regmap_lookup_by_phandle_args(), i.e. based on the
register offset stored in the DTB.  If the offset in the DTB is wrong,
there is not much we can do ("garbage in, garbage out"), and the DTB
should be fixed instead.

Is there another way the user can access these non-existing registers?
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

