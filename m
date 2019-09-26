Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 894B6BF24E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 13:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfIZL6d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 07:58:33 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40335 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfIZL6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 07:58:33 -0400
Received: by mail-ot1-f65.google.com with SMTP id y39so1723964ota.7;
        Thu, 26 Sep 2019 04:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eeoQ0YZDSAN1Yhf7QlrpEBrJAlJwUSg4T9Uf5I78lr4=;
        b=Kjf1I37k7KshLCAn1YfDZCzph8f9JFWuybD+w8DBtzJHbMf+5cs4d7p6nMV4Td65jB
         3Av81aFwqbgCmWi6fl0SDP4e9vVTO28xcQWYWiYSHGVefXDdmbir1Daunzg3SB+ts/t4
         yhuuhOlbD0ydRL8mWpQlsjAwrF9YXBBGCHewUBShIJfBCG6gZ4eAcMiE7U9nU4Gw2hAO
         5Jf2N14nXBa24H7GOpJxQvk6hpDBdJMyuoIImUhQME8iaHnZ/awXgttvonTZVooNZaGu
         HQQVMhofal/NsSSDRZ10ARgUCcOeK9H2rVgfB8PMkMRSc0FaOdUpQ4dmGK0MXlzQXOBC
         IQSw==
X-Gm-Message-State: APjAAAVHNjv/MCWLvJE3fTs3AzvG8bQAaNkX7fjucXp7JX42FTlas56C
        efxRx8Uf5DYI9d8Q/20IdFj1fh9JZtPR1tNof6zEE1kj
X-Google-Smtp-Source: APXvYqw/fH+qJ5l2l2o1QBjzylu0/UKxA7mCIJPLoVGOuXLsLuC5yqKX0PVT21Z8AJFV7ijyCkTgryfim+ZLCuqSKIg=
X-Received: by 2002:a9d:193:: with SMTP id e19mr2179729ote.107.1569499112545;
 Thu, 26 Sep 2019 04:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190924093609.22895-1-horms+renesas@verge.net.au> <20190924093609.22895-4-horms+renesas@verge.net.au>
In-Reply-To: <20190924093609.22895-4-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 13:58:21 +0200
Message-ID: <CAMuHMdU6O-pDRBRXXX1ZU1L4c25POrPcDB_TsbAqA9wzVobtAw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: Update simple-pm-bus
 node name to 'bus'
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Tue, Sep 24, 2019 at 11:37 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> Update simple-pm-bus node name from 'agnoc' to 'bus' reflecting the
> proposed binding description in json-schema which in turn reflects the ePAR
> standard - "the name of a node should be somewhat generic, reflecting the
> function of the device and not its precise programming model."
>
> Also drop the unit address as there is neither a reg property nor
> non-empty ranges.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2
> * New patch
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 96c0a481f454..99f376ebd27e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1373,7 +1373,7 @@
>                         clock-names = "iface", "bus";
>                 };
>
> -               agnoc@0 {
> +               bus {
>                         power-domains = <&gcc AGGRE0_NOC_GDSC>;
>                         compatible = "simple-pm-bus";
>                         #address-cells = <1>;

This file is included by arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi,
which references agnoc@0, so you have to update that one as well,
to avoid introducing silent breakages.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
