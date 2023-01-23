Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A617A6777EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 10:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbjAWJ5r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 04:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbjAWJ5r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 04:57:47 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9101BEB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 01:57:45 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id j9so9248619qtv.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 01:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IixvP2yH/0kUJed9UgY41TToIto0p3m3gfKa6QRADcQ=;
        b=hFt/ddSl/YrkahFc5etlElJgiFR+xfYI7BGoqQZh0J0qgBt0vftKP3Vjpe/EV9r5CM
         SpL83WzHGiy8ZJ/6UmHiNiV+HEBuBQTx4AfcMtl9kzZfEn+NFC2pYCywJiX+6lGnwDn6
         K8S0yO2CWFvtlqPxW30HMAY4FjZtCWg8b+ZkOiuLGyELN3UW4xUBBeUDXauHV2htryCk
         cj1cXx2foNeum5YM6+/ecsRppFIH4Dz+UuynpIZJYIRiVntKwHfB8YW8R8XQwKYgpANE
         3fKY6Al0RTvingU5X6wYXmmvbHaEpInmO1jeTarGiWIGGlvXIDwvVS2etrDnE4b1dOlm
         j01Q==
X-Gm-Message-State: AFqh2koLK9T/9iP9WgWmdF5yzDqWOkE5BukkVzX7gX91CouU2CRub3tD
        d9TJXtqdLehfQ3DnKqDDuBTFSF/sWa613w==
X-Google-Smtp-Source: AMrXdXsd1vppmmMNII4LIXE3HFhMhM+/RtjLgmdURcDDmLmEOsEr30jNyHyF4COgce6EvjEmJNmPpg==
X-Received: by 2002:ac8:6f09:0:b0:3b6:3468:8417 with SMTP id bs9-20020ac86f09000000b003b634688417mr37743963qtb.17.1674467864290;
        Mon, 23 Jan 2023 01:57:44 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id s11-20020a05620a0bcb00b00704a9942708sm31363994qki.73.2023.01.23.01.57.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:57:44 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-4ff07dae50dso118905657b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 01:57:43 -0800 (PST)
X-Received: by 2002:a0d:db07:0:b0:500:8d0d:7feb with SMTP id
 d7-20020a0ddb07000000b005008d0d7febmr1518907ywe.358.1674467863542; Mon, 23
 Jan 2023 01:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20230114225647.227972-1-aford173@gmail.com> <20230114225647.227972-2-aford173@gmail.com>
In-Reply-To: <20230114225647.227972-2-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Jan 2023 10:57:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdGWidVVKRDAy0op0_0My+9K6rUs15sRVLVj2rjt3Hng@mail.gmail.com>
Message-ID: <CAMuHMdUdGWidVVKRDAy0op0_0My+9K6rUs15sRVLVj2rjt3Hng@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: beacon-renesom: Update Ethernet PHY ID
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, aford@beaconembedded.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 14, 2023 at 11:56 PM Adam Ford <aford173@gmail.com> wrote:
> Due to the part shortage, the AR8031 PHY was replaced with a
> Micrel KSZ9131.  Hard-coding the ID of the PHY makes this new
> PHY non-operational on newer hardware.  Since previous hardware
> had only shipped to a limited number of people, and they have
> not gone to production, it should be safe to update the PHY ID.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index d3fc8ffd5b4c..a302f0ea8a48 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -59,7 +59,7 @@ &avb {
>         status = "okay";
>
>         phy0: ethernet-phy@0 {
> -               compatible = "ethernet-phy-id004d.d074",
> +               compatible = "ethernet-phy-i0022.1640",

ethernet-phy-id0022.1640

Fixing while applying...

>                              "ethernet-phy-ieee802.3-c22";
>                 reg = <0>;
>                 interrupt-parent = <&gpio2>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
