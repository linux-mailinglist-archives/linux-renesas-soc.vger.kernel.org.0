Return-Path: <linux-renesas-soc+bounces-11160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF059EB44B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D9B1613F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2DB1A9B4C;
	Tue, 10 Dec 2024 15:05:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DF323DE87;
	Tue, 10 Dec 2024 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843129; cv=none; b=RG8JuJqEWlMA8A1PpDw4MEo4jdjB7pBS+CXYLyjOau5cSPH7kz3xwwpxz31Uo6t+YGU0nWP+bAFVzRHol47tS6lkjv7XytSYAN9DSMBZChsEg5yUguRRTd8UdpvWL3ArtQTwa2dqqzgpXwZvrl+hbtlbBSDTW3+M13Fo5gX1bms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843129; c=relaxed/simple;
	bh=vMyGgUWMCYa9jqjFrSuzP8xhVfxy+uW+SLZCiWm+PtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtN/OzDYRxA3WFhkNsde7huesJRH6v32HZ8wGNxt8jBkf3zM2W/PVbWAUQqwMAKjKz30mz1qnMIIUVPPbgAEqNVRRj8eREMj1e6jBeTw5PmldfGZCc8sy4PEqhONjLv45V6uR8v21Fsz8dAwhIOXJxZHVi3nXGeFew3xPnYAUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4674c597ee5so25941931cf.0;
        Tue, 10 Dec 2024 07:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843126; x=1734447926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7MWr+x34y8+HIArGxN7+pSUdFwcwNgnGB9mNkNeiU8=;
        b=ldHMYRNpmg5B2y7/RsSrMzGpC/W30yOswNGkDr47zacPzP9OnZkDxeS4ZI1WqZpNGa
         uLRoxsJv8KeAMocBtmkJAyYdJ0SkvbYUx69FjDE9UVlA1JHLfszetYx6Ch+xo1QfVUQ6
         781vE8G+9ObF1ZChF9Ij/JHGUkwfsWT6iVqPYvc388nqvfp0HNG2b6bjhEHnnQNIYaKD
         OPl0tdKyMl6yFplKCZVJhZuEBKfWB73EawIzqz4a67PR0EgBS4hLdPM+HtKB9OuTTaLx
         HDZolGeSq8lTSISFEtMaHVcHHlpNz9pJ67bpD4kWu3HxyCHE6974T9/WZkCfgNhcEt3o
         pDrA==
X-Forwarded-Encrypted: i=1; AJvYcCVVlniMjIslVQwzC93UnBOQT9CyR2blkDivf58bw1Oe7qk5Xi9JskF+SppLbzkUpEzfT8eHAC/zl4PV@vger.kernel.org, AJvYcCVvzq29d41AgIB6l3qlJbsUdzySnQrROrbNglc8j9TqVIQd3aqbluVcSodzQYrJn5KXjJreo9XX7tvC/W5j@vger.kernel.org, AJvYcCX+2c1KegbjbbiYR11eL4vNmP2dNEhC9n50hsm/jVKC5TOMYpVdFg15hIrF4E9/xtkYH7mGu9cYdLWk@vger.kernel.org, AJvYcCXjmAPUgbgJPLathqrJUfxT+gVn9UdGdXFL0c8Fczi2RWUBaVzx6I0FW8OJS97E9wGWlyOFxIFRfCH9P2+2CyCbXyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDLK4HZvU3OoG3BJPUHl+RtqtDUDpe7hqZxOwDQhzDlRb+5YvN
	6Js75tur/6iDSu7rkH6qUk94OabUIuBD9POw2gdVWh3USaMG2BEi3ku9Fz7/
X-Gm-Gg: ASbGncsd+iT+Uxu9hVMbJmr6mcwM+MxQwXGoWdJAqhixg3uJgBXnLcIhFCAiBna/0pv
	NidO1DkTn5HNChmznILwt11fN2BupFzaLNTNTqQpX6jq4HC2tMnzm5gINEou+B/eQ1KyBPPPxpD
	+8CHxYqluqvhkxpy5Crw4EpgAlyhEL2Bn99ULje9Fm5NqEfohRKZ2t1ZuGtPIR/vL0g+WetFtHV
	6r9jF/ECO+Tsr1Xq39GEg0Aq5ByqrFuzxjR8Twy1HtDrSm8vrHV+CeGX/1LQdKf9ZVMDBU9t7Lx
	u3L1pNQUcnym2f6+Awb3
X-Google-Smtp-Source: AGHT+IGPTjSZX+qjTB3TaQJB4xiPWgMYlrBkuYve7Iw2M8Of0t/A7ltpVc4+780yYoZfi0Rw0MpXyg==
X-Received: by 2002:a05:622a:5a8a:b0:467:5e61:c10c with SMTP id d75a77b69052e-4675e61c42amr159056571cf.0.1733843125740;
        Tue, 10 Dec 2024 07:05:25 -0800 (PST)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4676ba6eb1dsm17037001cf.1.2024.12.10.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:05:25 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6dd0347dbso100623585a.1;
        Tue, 10 Dec 2024 07:05:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGexmVsn+AxOTlF6+excVPHJqQ06sUptX+HdOPCHkVOGY8u90gQuSUNpQ1Qnn5RRXU3ZBSYoevY9E2@vger.kernel.org, AJvYcCW71bqU58ObHqSm4dKfNLBjprYKYE2m4u09fErLLwdlb0JkZga8yDUHOZbscD+wUVqXvdi22UXxl76J@vger.kernel.org, AJvYcCXkxwIUjwihN8V4hGvnwWzL1LfN6jwqypt5ePIZSQx2sgjaZ2lKIrUbgKbjYadHtH0JFq3LwxfRAYZqnlTb05GZSlE=@vger.kernel.org, AJvYcCXnm+6P0db8NkDTWauACZcdl027IJqfFeyPIk2DLrX9kqPCrgz8jxm2lGXBDHhRr2gGmIKEPJpFGc/yV5Bd@vger.kernel.org
X-Received: by 2002:a05:620a:19a6:b0:7b6:67a6:5adb with SMTP id
 af79cd13be357-7b6bcad4a8dmr2816602085a.21.1733843124497; Tue, 10 Dec 2024
 07:05:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:05:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSgFwNEiijrnSCOif6VK5Ph1-d9=+NpWJsAbNVkaH0SA@mail.gmail.com>
Message-ID: <CAMuHMdWSgFwNEiijrnSCOif6VK5Ph1-d9=+NpWJsAbNVkaH0SA@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] phy: renesas: rcar-gen3-usb2: Fix an error
 handling path in rcar_gen3_phy_usb2_probe()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com, 
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> If an error occurs after the reset_control_deassert(),
> reset_control_assert() must be called, as already done in the remove
> function.
>
> Use devm_add_action_or_reset() to add the missing call and simplify the
> .remove() function accordingly.
>
> Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initia=
lize the bus")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> [claudiu.beznea: removed "struct reset_control *rstc =3D data;" from
>  rcar_gen3_reset_assert()]
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

