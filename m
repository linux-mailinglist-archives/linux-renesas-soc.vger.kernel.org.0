Return-Path: <linux-renesas-soc+bounces-1785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBA083AAE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 14:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5085B2871C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EACA77645;
	Wed, 24 Jan 2024 13:25:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA5277622
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706102751; cv=none; b=j6wE+j5kjLJOs8AQAN9VRyRilGutPt5GpSF227pOZB4tFpt9Q5Gmr/neFinZU2hp5aFtTb1z09tJc8G0eRrmu/ve7RWtdqeJ3+cgfg48lWYofneQv06ZUPieHJt1QYP5O5X59BwV+EbajxDS4M+450nC8reEhGr2AmVcZb0DEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706102751; c=relaxed/simple;
	bh=0YJDhKOIt2VPPmsnBnpwDSFlyoh0I0H/NLLdLdVGTAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prdhUCtf0He/JmbidnaeHjVZqkpfJ1aO9IHqeWJ1LpuUzo2ZKCTB6cRf/FmxilQ8wrtITEMeW5gu8QX8wWu9woYx53j2B3uxs4CrteIwb31HhGLNSO0O/W3idaeuvwNE+2AW9eVTlh4ibKHIqd/zp8oKA+mmULJt98tt9urm+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6001449a2beso23839207b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 05:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706102748; x=1706707548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hy0H0EZVDYFtEJ0eZjsAiED2zmpVFPtoVUwT7d+/Qq0=;
        b=tRsNGHT51//nY3l4zfHrMPXNphRPrY7tYk0uK+8mrcKXs8YrwcVpfyipwb7udcq/x/
         Jg8EqADHfjlozQDPRtZKbtiDbOAZkYi7I68NRjLyXFf7Y2+x/nizhLLiMqcG5AtTQDF5
         PYKDVNvaU8yScRAM6mggMwIj3rFW1WIaaU9wvmCt0vkxjN6JOYRCaJoqhk9QVtZOVTLy
         XRPYAIFtpHPm8LGeAy0spLQWj2VBX4S6BF2xreeO0AJGjuB2mXUTYTmc2bEj3u83llqz
         DLiGG9xQllrL2P2qIC/kRJo2c38itmXgq5fFtq+nPlhF3WSXaqE+BYk09j0uN88J3V50
         qH5g==
X-Gm-Message-State: AOJu0Yxr357q/SZxpVtUkOqCM4VvZ0/OZ4OTzjkk2mnXsW0HRZ/dm4Ab
	kH3FQnC8v/nqp13z0/Xi0lPSnK+IPbbMl9sYNCJ9NFN/z+hNiRCF5d/igOEnOT0=
X-Google-Smtp-Source: AGHT+IFootLViMsoycOCKfbByd8LoovrmiZE1CbVUIfNfIRI+3Ja9WyBhv/zfGgWSU18MWsLOyNIgQ==
X-Received: by 2002:a81:7309:0:b0:5ff:a528:e7f3 with SMTP id o9-20020a817309000000b005ffa528e7f3mr723751ywc.103.1706102747936;
        Wed, 24 Jan 2024 05:25:47 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id m9-20020a819c09000000b006003a34bc78sm1004542ywa.139.2024.01.24.05.25.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 05:25:47 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dafe04717baso4607423276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 05:25:47 -0800 (PST)
X-Received: by 2002:a5b:c6:0:b0:dbe:a175:3440 with SMTP id d6-20020a5b00c6000000b00dbea1753440mr514543ybp.92.1706102747496;
 Wed, 24 Jan 2024 05:25:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1702309604.git.geert+renesas@glider.be> <e9a9f541870450652952bca2b50603f9f8be940a.1702309604.git.geert+renesas@glider.be>
 <ZbEIKRyd82rMPGuy@ninjato>
In-Reply-To: <ZbEIKRyd82rMPGuy@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jan 2024 14:25:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9aj2XpP7dGev7qqVA2r0S42WzQ6WATiJJc6UuK6NfMA@mail.gmail.com>
Message-ID: <CAMuHMdX9aj2XpP7dGev7qqVA2r0S42WzQ6WATiJJc6UuK6NfMA@mail.gmail.com>
Subject: Re: [PATCH/RFC 5/7] arm64: dts: renesas: r8a779g0: white-hawk-cpu:
 Factor out common parts
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Jan 24, 2024 at 1:53=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
> > @@ -25,6 +21,12 @@ chosen {
> >               stdout-path =3D "serial0:921600n8";
> >       };
> >
> > +     sn65dsi86_refclk: clk-x6 {
> > +             compatible =3D "fixed-clock";
> > +             #clock-cells =3D <0>;
> > +             clock-frequency =3D <38400000>;
> > +     };
> > +
> >       keys {
> >               compatible =3D "gpio-keys";
> >
> > @@ -135,12 +137,6 @@ reg_3p3v: regulator-3p3v {
> >               regulator-boot-on;
> >               regulator-always-on;
> >       };
> > -
> > -     sn65dsi86_refclk: clk-x6 {
> > -             compatible =3D "fixed-clock";
> > -             #clock-cells =3D <0>;
> > -             clock-frequency =3D <38400000>;
> > -     };
>
> Why was this moved?

To restore sort order (alphabetical by node name)

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

