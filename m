Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A10066FB0BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 15:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbjEHNBR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 09:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233480AbjEHNBQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 09:01:16 -0400
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECA235DB9;
        Mon,  8 May 2023 06:01:15 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-54eb5cdd418so3201551eaf.0;
        Mon, 08 May 2023 06:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683550874; x=1686142874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfxlUKoKVOdapAUeHamF9rzuZg6eIZiUfEdwIu+ZR6o=;
        b=Fc03tnFoHN50jwvkFlPlwEFNww/UlCEzCohiLfWvPBh+aY2Sq0fzV3Ck5JWelf5LKz
         byprpHC8/GsPQ0K35sJsZfLAD2b+zV+iLhquJoYHw/WE4XAAWoU0T0poM9c3vDdot7/y
         Dfl7AauW1995okxFgx67HvLbGza0ezwUpOb83EKBFPXErB68jiAvaXlF6BvOsqedlGOk
         BJW2qnvXif0z5MGUaOuEtV5qIzvcJvcWfbZfz9tJTNB/hDF0DVW4NrlKVBMnaSgafmZE
         Tq+Yb1/xnQsQAWB3PqD+Ax2Ju1LxmoDg2j8MzTBYBF1qwrR2YpLMSoT4VxtoEDC3PVGM
         D0VQ==
X-Gm-Message-State: AC+VfDxAJlZNIy9rDyNGoEcy0HTovn0ANhH663TQ6+hpSufL+ghde7mh
        ZaIeCU0qv1Hz05QefkAQlHvKSgXzV91vPA==
X-Google-Smtp-Source: ACHHUZ6mwFkEGR8gncrtClsh8dhx7WFWf8yEBWq2yZdlaih8RZoUy/IHXFxoB8G3hUHAU5ENPohfTg==
X-Received: by 2002:a4a:6f44:0:b0:542:5d35:12a0 with SMTP id i4-20020a4a6f44000000b005425d3512a0mr3923531oof.3.1683550874006;
        Mon, 08 May 2023 06:01:14 -0700 (PDT)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com. [209.85.160.45])
        by smtp.gmail.com with ESMTPSA id s1-20020a05683004c100b006aaf7794654sm1822164otd.61.2023.05.08.06.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:01:13 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1928aa70ffbso3710995fac.3;
        Mon, 08 May 2023 06:01:13 -0700 (PDT)
X-Received: by 2002:a05:6830:199:b0:6a6:4220:70b4 with SMTP id
 q25-20020a056830019900b006a6422070b4mr5059515ota.21.1683550873315; Mon, 08
 May 2023 06:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 May 2023 15:01:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFXb7Uodo+mMSHnXDZ7m-5MB0fJ9Jc_La50s01gieLPg@mail.gmail.com>
Message-ID: <CAMuHMdXFXb7Uodo+mMSHnXDZ7m-5MB0fJ9Jc_La50s01gieLPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: vc5: Fix .driver_data content in i2c_device_id
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-clk@vger.kernel.org,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <sboyd@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, May 7, 2023 at 3:39 PM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The .driver_data content in i2c_device_id table must match the
> .data content in of_device_id table, else device_get_match_data()
> would return bogus value on i2c_device_id match. Align the two
> tables.
>
> The i2c_device_id table is now converted from of_device_id using
> 's@.compatible = "idt,\([^"]\+"\), .data = \(.*\)@"\1, .driver_data = (kernel_ulong_t)\2@'
>
> Fixes: 9adddb01ce5f ("clk: vc5: Add structure to describe particular chip features")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
