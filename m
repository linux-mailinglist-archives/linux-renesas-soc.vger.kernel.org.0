Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A9726422E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730656AbgIJJeF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:34:05 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40810 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730791AbgIJJdt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:33:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id e23so4791290otk.7;
        Thu, 10 Sep 2020 02:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/C47IB+M4nbaJ9760h1nUtZkhySt02neFnlZ98xNcsk=;
        b=X6CvrbmrMXIQZ9XAdwJxI3iIAEp9o/w/jhssu47T7nVwji7LN21JlQaF67YJgQyDaB
         eXF2DYp5RHqshNjSW8hD64pl4nb6EdL1/2m+a47uMN5djGqS4o/Es+VsUtNQg/jiZ7pG
         7VNnxchVA5RupQpTsLZHZn4BH7QL1aoD/x++dx1IEgm90xwBbMgN7umcy2Yk2qz4luTq
         Sp8bph9ur0IW/C+3j++y1JlyYAvbDqE8XZPKe7HwBd/K3H/LjtUybZvd29dFr97hCjf0
         Xde5cldfpw8c7vBvJX7RXHzcB87FMZzoixTJ00TWI/B81Dpfrl9EcDILcc4Kp0qcyG48
         eHJQ==
X-Gm-Message-State: AOAM533Wp3icg8dDtRrN5/VZbJoF+KFDbYfStdbIIr3EqovGB9M4o+ST
        uaOyim5s3wGMPmN6jfcx4wTfrghMBb0oTpz+Fn0=
X-Google-Smtp-Source: ABdhPJyKtepHyQ3hj+VpqxVbmkIPUxk+KZPk5olzAOt0nNaXE+lJagqO0th4OOsmJLg0LdaTe+wwlek1fosVWcd6QfQ=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3428638otb.250.1599730428650;
 Thu, 10 Sep 2020 02:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com> <87h7s9rtvl.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h7s9rtvl.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:33:37 +0200
Message-ID: <CAMuHMdWaH7eTFTxPUR6qmxV1m=GK_LW7o=ct7x+yE2UQJDy2ig@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: renesas: r8a77961: Add FCP device nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Sep 8, 2020 at 2:34 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds FCP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2004,6 +2004,58 @@ pciec1: pcie@ee800000 {
>                         status = "disabled";
>                 };
>
> +               fcpf0: fcp@fe950000 {
> +                       compatible = "renesas,fcpf";
> +                       reg = <0 0xfe950000 0 0x200>;
> +                       clocks = <&cpg CPG_MOD 615>;
> +                       power-domains = <&sysc R8A77961_PD_A3VC>;
> +                       resets = <&cpg 615>;

Missing "iommus = <&ipmmu_vc0 16>;"

> +               };
> +
> +               fcpvb0: fcp@fe96f000 {
> +                       compatible = "renesas,fcpv";
> +                       reg = <0 0xfe96f000 0 0x200>;
> +                       clocks = <&cpg CPG_MOD 607>;
> +                       power-domains = <&sysc R8A77961_PD_A3VC>;
> +                       resets = <&cpg 607>;

Missing "iommus = <&ipmmu_vi0 5>;"

> +               };

The rest looks good to me, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
