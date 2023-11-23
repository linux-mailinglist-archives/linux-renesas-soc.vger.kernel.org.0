Return-Path: <linux-renesas-soc+bounces-171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1339F7F5B1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 10:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01C04B20E52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 09:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A435A21107;
	Thu, 23 Nov 2023 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A42019E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Nov 2023 01:33:10 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso627847276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Nov 2023 01:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700731989; x=1701336789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVIh8Nen0iEpvM0pwzhPkBhl2leXJpwohAUH5gZ75dA=;
        b=OEoCX8Tx8mMrw9WEzKnzuIOIF6SIkrWKFVR9Gk30UTh45WernsqOUic4N7IMXouXoe
         8dLVv90gjMSGKa8cmQFaOWgFBn9yl9eJkl138qmdaBqK9qHQaXWMCFuwN1KzlLHGcQfm
         zDHILwaIgXpLAl270ZwatRXXJ6vz6szaZW+BKE66kDzU8wRwvJaTbX7DsrP6D2PGhd8w
         QOAd6XvFHvD0hydVK7baacyOct6uqMEzJVTjYCu43ZwfFguvu4jUTXV9Vf7ccMmb1zXK
         L4BsKXsvssALg50x5kOM1A/hyBaW8vSV/c7isHmd/cw5J4Z3EHSi8Ah2DEH2LfO4amVP
         nB4g==
X-Gm-Message-State: AOJu0YzcB5g55R6D3Qe3Uz+UhtfulcIS4+uNYWEq6rfH0+RH/uTXAcau
	C3qDMev7l0hTCvexQYSdnQLgmfPWYMpo5g==
X-Google-Smtp-Source: AGHT+IGEgWLXRRCly/cHbophq0VxPKsyg5IlqtPiFtZn8EME5cb8zlJaaU3T0CpTPRlrRVPdplPqGg==
X-Received: by 2002:a25:d881:0:b0:da0:c744:3211 with SMTP id p123-20020a25d881000000b00da0c7443211mr4629044ybg.2.1700731989159;
        Thu, 23 Nov 2023 01:33:09 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id b5-20020a25ae85000000b00d9a4aad7f40sm230197ybj.24.2023.11.23.01.33.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 01:33:08 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5cc66213a34so6890157b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Nov 2023 01:33:07 -0800 (PST)
X-Received: by 2002:a81:4709:0:b0:589:e7c1:96f2 with SMTP id
 u9-20020a814709000000b00589e7c196f2mr5148439ywa.46.1700731987684; Thu, 23 Nov
 2023 01:33:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230824083006.88944-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824083006.88944-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Nov 2023 10:32:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQeFOnA+ZC4mOdn2M+LCLD7tgU59m0BLYEpEU0y4+kiA@mail.gmail.com>
Message-ID: <CAMuHMdVQeFOnA+ZC4mOdn2M+LCLD7tgU59m0BLYEpEU0y4+kiA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas versa3 clock generator config
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 10:30=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Enable config for Renesas versa3 clock generator as it is populated on
> RZ/{G2L, G2LC} and RZ/V2L SMARC EVKs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Now it is used (as of v6.-7rc1)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.8.

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

