Return-Path: <linux-renesas-soc+bounces-2825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A52855C53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 09:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1F9294A32
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 08:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D86213FE0;
	Thu, 15 Feb 2024 08:20:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F961B286;
	Thu, 15 Feb 2024 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707985227; cv=none; b=fWoTNEP1Ug4Yootv0oNhMWWkAD4+n/fdBevz/IH/rT7kLTRrCWXxAJoq+YlJCeBjVMrhexAhCcHMsRo1V4mZtkDPhHKfMRTQRzWLUMSHMyQDKKzj53fe8InmjYJg8OZWLycFw3BHQ/Pmr/cnPUxcXHmQPxVSLUZ8LTcHZLh/bAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707985227; c=relaxed/simple;
	bh=MINEe6XyNZcQLhHnYcYaMeyr5jGGWEilGs8K5A1XBVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RD5uiXRZ3++vbJL0jbKgmBnhNd2CHZownbVufCmfLf9cHjtx9NI3VP7A7rZ9RTxEisXqPmY8KxKFNcYl62NCW1MgN5AUk4NXDDaj3ztBk4WdfQmbnSxc0bbeQCYDdvkLk1bDUztywdo602YzPDnofjIA6vsqt7Oeh7dZkUQap7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60790e62f90so6375117b3.1;
        Thu, 15 Feb 2024 00:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707985224; x=1708590024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgwUELbusLa736ATEYhY0rommxgZdsKPDxk8M2ztoHQ=;
        b=t0d3PkBNSo1rbfIOTQxYKXmr7inbx5rWAD5+sgn/11s0oKDjsDRYTE3l7lxO+xgzBH
         tWnjTSA1aNOtDBVfjKu5oSWlxmSCcdmY3rkEfIA/vcZ4KNwetWRn/H+UPp7fpJXguju5
         UamPa/zeMDsPU7miCD4Lnzym5Y2QFPaFBtMXUjaSQ76jELpy7pUjEgtFV3O4Pguw4yDC
         mOgler2+2mePZU2OmirBtDJ3IpO9IjLW1VBzKkXSuU6i0zb4BVGDOH+SiZrMXURPQx1+
         9R5FLJMVnetYGV545yvgqGzakMrBbEP86HVVaAcDL22ddPKd6rJAOueQVxF4AELtv0x8
         DYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz3zkAKY2U6gn1jh4GQengtpmllUDnvrrdDsptae4l+mS/aV5nSkcj63bGxQ1q/Af6CeZh0H4+fJWsb6T8kkwFU54wJFCaRu9/GgoTVU9UWaqCt6beJ/4sLw7YfL0zi4Ao98B9J8WJS8v2Si05
X-Gm-Message-State: AOJu0YzFYDTgrpYwd+Y76nfPOUS+5pYXzctt6jcutszqOJ5rWepFPlxP
	qWiYyzPSy0Iz3DPAjPFZx1og+bnRvh7vy9S+RGKCr6PNF9QcAHNCsSyO+fRouOw=
X-Google-Smtp-Source: AGHT+IEtktCR1tDGWpuqWkrCmfFV32+NPWxit2320flrSzzBnRWmy+IDoBCB3PD6RiK7ecJOqww88g==
X-Received: by 2002:a05:690c:e21:b0:607:5b6a:9208 with SMTP id cp33-20020a05690c0e2100b006075b6a9208mr1078824ywb.49.1707985224024;
        Thu, 15 Feb 2024 00:20:24 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id o189-20020a0dfec6000000b00604a80b94b9sm154971ywf.129.2024.02.15.00.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 00:20:23 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso521755276.3;
        Thu, 15 Feb 2024 00:20:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYDQHleHlCQ8su6Gajiun18oeEWDE1ftHITPiRNtiZ+CKrzy/AchCys4k4Ck48GfqG3Y4Waj1kLnTMcrmZ9EFdg2xtOzBaz62PlSeYyJ9I9ISX+zbX2w1DvwB1zdZ0gqDmluvdpW5OqG7w516O
X-Received: by 2002:a25:f402:0:b0:dc7:48d7:9ed8 with SMTP id
 q2-20020a25f402000000b00dc748d79ed8mr1002893ybd.20.1707985223287; Thu, 15 Feb
 2024 00:20:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cyszpwmp.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdXih9g46JKvz_UsjH3h_OrJOJLnFv6ixpYjE6Q4DRxbsA@mail.gmail.com> <87h6iahb6o.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h6iahb6o.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2024 09:20:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAbbVs=OOkqsKz11e2TtbUWSMxNAiG+kus_T-0cr_ZdA@mail.gmail.com>
Message-ID: <CAMuHMdXAbbVs=OOkqsKz11e2TtbUWSMxNAiG+kus_T-0cr_ZdA@mail.gmail.com>
Subject: Re: [PATCH] ARM: renesas: r8a7778: add missing reg-name for sound
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Thu, Feb 15, 2024 at 12:35=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > This never triggered with "make dtbs_check", because
> > arch/arm/boot/dts/r8a7778-bockw.dts does not change the status property
> > of the rcar_sound node to "ok".
> >
> > Can we just add a line to do that, or is anything else related to
> > sound missing in r8a7778-bockw.dts?
>
> In my memory, first BockW support used platform-data style
> (=3D arch/arm/mach-shmobile/board-bockw.c) but was switched to DT style
> after that by Ulrich. I don't remember details, but when it switched to
> DT style, we already focusing to Gen2 board support. So I didn't use it
> via DT style. I guess he didn't test it, because it is missing many
> settings to use sound on DT. So, just adding a line is enough anyway.

To clarify: adding the line is enough, or is not enough?

Thanks!

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

