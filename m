Return-Path: <linux-renesas-soc+bounces-458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6987FF1C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 15:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EB4EB20C8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 14:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AF14F888;
	Thu, 30 Nov 2023 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E13183;
	Thu, 30 Nov 2023 06:27:16 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5cc55b82ee5so10362997b3.2;
        Thu, 30 Nov 2023 06:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354435; x=1701959235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUPLQxkPKo/lx9+zPsmkqSqbakwoSP37CzyXu4lnNwg=;
        b=VuEjh464cQF7S+JXwZellJDWGR101ABBk3DiLQ1ms77GYtcFCMQxNVvLFVGVXKFaG7
         FTj3CKpbgTb7t0sz6FIoO/eP3ItN2Qiz92p+M7XCmLxSCF/RTy21qx8y3N+K++yQB56e
         ItVHeC0MPxorkMsA0naOPMAg8uhwR6SMWI7PgxvyrDTc5LwLad+E7/ybSxJFWh+nOlVN
         Mhp9sMHc4zyjN0AEkfmctNfnE6Q3pxOmMg3Ivdo0n7fxppRXdihnmn9mx5EeFJky5rhc
         c5oT/7l5g/KLkXQi8E1j8bBIrC3Amv7+JpUrGn0Ng3PlN8AZTC+snFf54HQVNRvyR4cA
         iLTw==
X-Gm-Message-State: AOJu0Yylaqpow1XLweRSemSdC6Ugiwfu4CkVlLqPakw0brPpuCCCz/2i
	yT3QRgvcZwUUIHitI4MbHXac0b5pr+AIDw==
X-Google-Smtp-Source: AGHT+IESB4QryHpSFLrQTBm2PZqwhmcm9QzO1CkqTJGozDBR9LMTGheFb4k6UDjuhU45qfCOx2kg/g==
X-Received: by 2002:a0d:de82:0:b0:5cb:a6af:6a1c with SMTP id h124-20020a0dde82000000b005cba6af6a1cmr22186822ywe.31.1701354434983;
        Thu, 30 Nov 2023 06:27:14 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id q8-20020a815c08000000b005d0494763c1sm381521ywb.140.2023.11.30.06.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:27:13 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5d35a952943so6104537b3.3;
        Thu, 30 Nov 2023 06:27:13 -0800 (PST)
X-Received: by 2002:a81:e30a:0:b0:5cf:b796:c40b with SMTP id
 q10-20020a81e30a000000b005cfb796c40bmr14401875ywl.20.1701354433444; Thu, 30
 Nov 2023 06:27:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125232821.234631-1-niklas.soderlund+renesas@ragnatech.se>
 <deacc7ea-6fad-47d6-978b-3f639aa5da35@linaro.org> <CAMuHMdUcbr--3Cs4+2m=hOehXJt0WqiuYqV_j0DBmR+YgoEb-g@mail.gmail.com>
 <c6c3c356-e0dc-469f-aa24-6701fa06fba8@linaro.org>
In-Reply-To: <c6c3c356-e0dc-469f-aa24-6701fa06fba8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 15:27:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU05FawKFMDMQbxDk6+TfXPhPwH3nuRk+r0ZOQefVMThw@mail.gmail.com>
Message-ID: <CAMuHMdU05FawKFMDMQbxDk6+TfXPhPwH3nuRk+r0ZOQefVMThw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: renesas: Document preferred compatible naming
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Nov 28, 2023 at 3:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/11/2023 11:32, Geert Uytterhoeven wrote:
> > On Tue, Nov 28, 2023 at 10:51=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 26/11/2023 00:28, Niklas S=C3=B6derlund wrote:
> >>> Compatibles can come in two formats. Either "vendor,ip-soc" or
> >>> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> >>> policy and enforcing it for all new compatibles, except few existing
> >>> patterns.
> >>>
> >>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> >>> +      # Legacy namings - variations of existing patterns/compatibles=
 are OK,
> >>> +      # but do not add completely new entries to these:
> >>> +      - pattern: "^renesas,can-[a-z0-9]+$"

[ deleted 40 legacy patterns]

> >> No, wait, you basically listed most of the SoC as exceptions. What SoC
> >> blocks exactly are you going to cover in such case with your rules?
> >
> > As Renesas was an early adopter of DT, there are a lot of compatible
> > values that do not follow current best practices.
> > Unfortunately there is not much we can do about that...
>
> Hm, ok, given how many exceptions you have, just please consider whether
> this schema will be of any use. IOW, how many of new SoC blocks you have
> which are not covered by the exceptions?

Given a modern SoC hardware manual contains +200 sections, there
are still lots of opportunities for new SoC block bindings and drivers...
We really do not want any new compatible values of the legacy form.

I guess the TI people could use a schema to reject new non-standard
compatible values, too:
https://lore.kernel.org/all/CAMuHMdUYOq=3Dq1j=3Dd+Eac28hthOUAaNUkuvxmRu-mUN=
1pLKq69g@mail.gmail.com/

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

