Return-Path: <linux-renesas-soc+bounces-9082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBF987367
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 14:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB4101C20930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3454158851;
	Thu, 26 Sep 2024 12:18:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA4D14E2CF;
	Thu, 26 Sep 2024 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353083; cv=none; b=Uty0pdY3gFJ1eaO55qp4anxzAGD+JkZa89yCFgI2+0d1ZZ4CSb8j4Oq7lpyjqeCu8aI2eDkweDZX2q5o+MqGfO2mfovjO+nXRVjt+PDIYlxe2m1DFqWeFGwGJ0CSuY1hl4AE4gVZZT2KuV2euzyHp0F04ZNGCfblRLb2V6JUA28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353083; c=relaxed/simple;
	bh=R1lwEz86pm6unQJzc+cjrlS1nf4NCEjURX/9y9QaGS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQOu4Fx8uvRItTVhWKbspLGxmzN1e1EjpRZT4w75CvQf2nwLqeGGirRbxzaWqvdIqKBBSRNMEMq1JqhDP8X1Rz8wBECdCO1QKaSKom+6SAiyikLH6T5eTMXH3aBLKRakrcFAsro5GNIF5rFLvBi+8rHpIA6n7w1N9HlkjU2lmgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e25d380b464so344277276.2;
        Thu, 26 Sep 2024 05:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727353080; x=1727957880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLq2mSCe0q1ZZjgGfneTrUE49QynzQD1fTS38glb+oA=;
        b=ac2jRPFrJWs1IyumssskI3yUARlAF9Ba6rK2FIfQpMbJV0coaVJHSLHXeHSR5s/vlj
         U3pLXjbqu7537TI9vHQGByLeGamVR7xXWDc9PHo2nxs9i/Co3s02HStDV3ValTvyYrJ9
         kaQdiO0cjzvZV2LD3Hcfy4h9zhC5GfJiugf66ahC861VKp27cQLpVChkzvwnEW+swBDq
         eyYbfdkH8OXoRNW2rN9grlPPyfT5dfwzXODcOhics30HVCCJlnizjR3JqYuPxlI4zTqt
         2DbYSeVSBCw8sBqf63eYXUnfeWVU9AKeH3vY1zjM35J8+m4CDkmw0aZb3KvJIaG9UozI
         0CkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXzMm6osXwRTrF7C5dNaGOemj7TRDkRpGoEu/Nl/+ZGzpDQPYRSO1qzpoxERejAaCJiLGM2jNC9JpG@vger.kernel.org
X-Gm-Message-State: AOJu0YzzTKiiCwHUrFTo7ZxePv2n9d/dFnY8ncX67zUfXdDKYH5AOlRd
	HPziV8BheW8GHXbMRW9xcp0fO8jL4049/e9We9zEh2nqnK+g1rPZnBka57YP
X-Google-Smtp-Source: AGHT+IHIpCLQldmPwGpZK0HITbDpCSpOxVB/waOn8/0JFJarHOh8En55XuJ9f294doq/81A3JU88yg==
X-Received: by 2002:a05:6902:1b86:b0:e25:caf5:1209 with SMTP id 3f1490d57ef6-e25caf512f4mr2043104276.3.1727353080097;
        Thu, 26 Sep 2024 05:18:00 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2499ae68fesm948512276.12.2024.09.26.05.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 05:17:59 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e129c01b04so7975807b3.1;
        Thu, 26 Sep 2024 05:17:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYrq5W+qFGJEBDJgovX4m5sJTgIk1hNxggUrBY9R5uYxxq058nuh9kRuv8eHUwOHLXBlUrJqvv2Jct@vger.kernel.org
X-Received: by 2002:a05:690c:6407:b0:6dd:c0eb:dd99 with SMTP id
 00721157ae682-6e21d709e5cmr51595807b3.13.1727353079491; Thu, 26 Sep 2024
 05:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com> <20240921114813.4124-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240921114813.4124-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 14:17:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUv7u7t2AJoo50UeB-=3G_4ib8q2NSTFOugUJwzDvaNUQ@mail.gmail.com>
Message-ID: <CAMuHMdUv7u7t2AJoo50UeB-=3G_4ib8q2NSTFOugUJwzDvaNUQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: renesas: genmai: enable watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 1:48=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Driver has been submitted meanwhile. Activate the device.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

