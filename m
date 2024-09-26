Return-Path: <linux-renesas-soc+bounces-9080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE2987330
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 14:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0864B2863B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7516A175D39;
	Thu, 26 Sep 2024 12:01:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B80171088;
	Thu, 26 Sep 2024 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352061; cv=none; b=GCN6B7GuARLy8s2Lq/vhglWeJMgaD0kGuaclcUITeHtG/fjXVLR93bMt1hLZpn1u7QPuq6jT6IPQANu5AJGpMkSBSEjqxMt4lUr53PFkJihZu5Z79k0I5gGfMfxhTO5kRa3Hq1MZVwDJ7Bve87IN2TCmDKfVXHUkxJvnfFVdAMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352061; c=relaxed/simple;
	bh=M5LwKX11UABhQ3WV980BbjVHWSTbksqC8/3yZSqi9Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOqy0X0jWPrm8h7r8ad0HuP9hKlAKUHrfLaHBPqGc6qotZShcwSDyqHBcnqjbB5KOeOMHvynY5F48GBMxaIClhTqQQetGQ78YElAwjbIsUf21HPwYtXTMu1eJ2svpJ1mM1v6aelob0+RRt4VN1XcjPDsrYC4eTmsv4sxf++heLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e25ccd64be9so663492276.2;
        Thu, 26 Sep 2024 05:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727352058; x=1727956858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NztW3rzneZk6pB0l9kjPf8VFMhKuqsOv7WNRQfvXinI=;
        b=Ju7360xPljCe7AWpYw12hFTAjCeJFtgitSm1y7MGPrQC9CSRG7HoGx8D6opEMk2RMP
         dLwFxQWofnqyCH1n8VyLy/Eq4cch+2qGhZcobdIDLt1RNRW6KugeJH1DuUv0s9yKyTR+
         Jqq0MmGuew1djRtVUQcu17S54vhZ33lm3+1DNgOjVpT4auczzznqxfZ0XIOTET+mi1Op
         ilWbB6hfxe7My+CuY7auYfpoUQIWJkhJvYfRyk2fwRzMtLLbhsxM0GIhmtDyxEB7MNU/
         gGJvD+v87k8Yyn5N0bvRVn44LYt4RBuE61bnVi8gn4mqYczUr8ujLK9QFrrEMfJILFmW
         F6KA==
X-Forwarded-Encrypted: i=1; AJvYcCU6OZnhRKbeUJI6x5Y4X0/EbGVOA6QRelWfzHIulgc7JDL+1l0b/EKpScr5YT7DC/xdSdbzW6iPYj3orXk=@vger.kernel.org, AJvYcCXsAgY1TAHW5V7PoBXg4JZ2ipKktoTCyhGPaheW5wdXt43CF20bTE/jXMWZBOtOJ3uzPHLmD/ioMzPK@vger.kernel.org
X-Gm-Message-State: AOJu0YwNprp/iNyF+xKyka5Fs3EMrEyHMfDgZTGM1qq1Gi0HXAhGkYX1
	+uo69WlFIyOFcshJe54MCYOcI6wh961Hdny7czmaN7Mj1xhaujoMJD5hfex5
X-Google-Smtp-Source: AGHT+IFR+B/BOn1qiOPrgzrl3IA93QhDJe3nBQZ2M2BqPfFWynpRUQALgc3JuJ6F33KuY2Rsl79j7A==
X-Received: by 2002:a05:6902:218a:b0:e1d:eaf:8681 with SMTP id 3f1490d57ef6-e24d97ffc23mr4321751276.40.1727352057751;
        Thu, 26 Sep 2024 05:00:57 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2499c7bc4dsm931883276.64.2024.09.26.05.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 05:00:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e22f10cc11so7889437b3.1;
        Thu, 26 Sep 2024 05:00:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSomSbiDlyLGfJGmHPE5ZzlC20TgKKs7JWzHprf1N0a4dM01yx8y2SXhQgOjP1AHiIuvbC9FhjIUMl@vger.kernel.org, AJvYcCUtik6aJudRYgAobmGmDWlJzL13BAnzIku7sqIIQVMISmd0JhXzTi4cTCBolZa3zlGJSoDh/Uqx6cCy+7Y=@vger.kernel.org
X-Received: by 2002:a05:690c:4a90:b0:6db:e2a3:4158 with SMTP id
 00721157ae682-6e21db97daamr33690887b3.46.1727352056856; Thu, 26 Sep 2024
 05:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926113241.24060-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926113241.24060-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 14:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwhfqsntn+5JuTjU=FyE4odZ--yJTMtpD8ST9DXqJ=Rw@mail.gmail.com>
Message-ID: <CAMuHMdUwhfqsntn+5JuTjU=FyE4odZ--yJTMtpD8ST9DXqJ=Rw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rsnd: correct reg-names for
 R-Car Gen1
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Sep 26, 2024 at 1:32=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The device at 0xffd90000 is named SRU, both in the datasheet and SoC
> DTSI. Fix the typo in the bindings to avoid the false positive report:
>
>   sound@ffd90000: reg-names:0: 'sru' is not one of ['scu', 'ssi', 'adg']
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -302,7 +302,7 @@ allOf:
>          reg-names:
>            items:
>              enum:
> -              - scu
> +              - sru
>                - ssi
>                - adg
>    # for Gen2/Gen3

Nice catch!
Fortunately the driver uses only the "ssi" and "adg" register blocks.

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

