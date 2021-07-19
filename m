Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517173CF089
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 02:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239988AbhGSX1h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 19:27:37 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:38514 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389538AbhGSVfs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 17:35:48 -0400
Received: by mail-il1-f182.google.com with SMTP id s5so10443501ild.5;
        Mon, 19 Jul 2021 15:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=874ZtwewxQXPmAbbhVDeMiVd05ey4l+/IKy2ovtuitI=;
        b=DqPpQCpL+FgzoM0rOjSL5tvgtM4gu5IVhQSHRJbntQ7AbaY+EewMB4IUJuhQui2q39
         gUHNByDGHE2Ph4H/hxTVeT3MMOUCa3YCk79wyK13atRrJoVda/1YKRmAKlIQJVG8NvXq
         vs3EH6EsMg9+Rbmi/HeCrsG97k5FJG2U1KPLmpZ0rJv0ROKTbPyx+4oKlYDxR73xY+X4
         r/QJ1y06iJKkG7OLAG2r6nKZukLmynxkXJiWpRQFJuBeOU99kG6o2VSD3V7iMxd91jof
         033BUpWaelyUF/Q+sC0zqhdHb8saCLb+ihXon5KATNRBrQA5OyyBHSV1lnyJn0wKVODC
         /Vvw==
X-Gm-Message-State: AOAM5313E/evp4JbWCxTwMTySCU4RqlUXJsa3fMMs3Veqdhd1hTCEHPG
        eFoRpJmH3MVRSoVUj9eutg==
X-Google-Smtp-Source: ABdhPJy0wIMrRJZvaZ8C3U3+0ufoLOCgddvaLLTczqOg1l4VABQ3B1O61gghWf9BfbPEH4Ip5Qcqeg==
X-Received: by 2002:a92:c005:: with SMTP id q5mr16040538ild.117.1626732985753;
        Mon, 19 Jul 2021 15:16:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w14sm7444837ilj.76.2021.07.19.15.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 15:16:25 -0700 (PDT)
Received: (nullmailer pid 2698560 invoked by uid 1000);
        Mon, 19 Jul 2021 22:16:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com> <20210719134040.7964-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/8] ASoC: dt-bindings: Document RZ/G2L bindings
Date:   Mon, 19 Jul 2021 16:16:22 -0600
Message-Id: <1626732982.918933.2698559.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 19 Jul 2021 14:40:33 +0100, Biju Das wrote:
> Document RZ/G2L ASoC serial sound interface bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Rebased to latest mainline rc branch.
> ---
>  .../bindings/sound/renesas,rz-ssi.yaml        | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/renesas,rz-ssi.example.dts:31.34-35 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/sound/renesas,rz-ssi.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1507078

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

