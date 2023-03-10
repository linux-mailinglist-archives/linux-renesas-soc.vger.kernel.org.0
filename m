Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58D376B41AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 14:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjCJNzS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 08:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbjCJNzO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:55:14 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F1310F467;
        Fri, 10 Mar 2023 05:55:12 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id cf14so5650283qtb.10;
        Fri, 10 Mar 2023 05:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678456511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIONDeBFSsx7/+t0CQ2gB7qRM17u5AAx7/ZtR9C+8Z8=;
        b=pn8kpWBt5IeSSTgsM37n4Q08++B1QM2ciBLSY/5+Yh6go1d+Cz5Kc1ByqbXR852Ypg
         /mbfHrtVv7P4pTrR/eFrCW5kHnG7zCEz22l5xc9HrRCp5tGyy+L4wT/KdKoLKUfPYFWF
         O94rSlF2gXCFvMbo2Klk1yUcgXOdBML0fMlMw/149ZkEMlRc41Jyb/0+VOAVdWerTyRX
         mgE7H4TsO3Iyf6KRV9bwLx+3WvH+BIJJCRxDl52Q+QQ7T2bria4+ytbJj3PvXUIZi4zG
         mnjLS+rZyiDbkNn8KZxNHDfmjNMkSnPBpdrQDBsYnNkd71OoOSPGsSkedhT7JrEznuvI
         HGGA==
X-Gm-Message-State: AO0yUKW0lpdEvzXdJA/WzioBFtrthw+x59wI5MCS4eum9cjTUD6BwyR7
        Gm52VAbzORkgTi/Gj4jTTmrSZ07RK6wKTg==
X-Google-Smtp-Source: AK7set9XGlFRgzwKpUgl2ZdBhAAuqCko92VzRekLecHqXpDQJjsx3mBuDqfm/c4rD2rXVya8wjWWJg==
X-Received: by 2002:ac8:5c4a:0:b0:3bf:c6be:cbbe with SMTP id j10-20020ac85c4a000000b003bfc6becbbemr44761256qtj.1.1678456511013;
        Fri, 10 Mar 2023 05:55:11 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id q23-20020a37f717000000b0073b399700adsm1390084qkj.3.2023.03.10.05.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:55:10 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-536bf92b55cso98343007b3.12;
        Fri, 10 Mar 2023 05:55:09 -0800 (PST)
X-Received: by 2002:a81:b723:0:b0:536:38b4:f51 with SMTP id
 v35-20020a81b723000000b0053638b40f51mr16535772ywh.5.1678456509654; Fri, 10
 Mar 2023 05:55:09 -0800 (PST)
MIME-Version: 1.0
References: <20230301215520.828455-1-ralph.siemsen@linaro.org> <20230301215520.828455-3-ralph.siemsen@linaro.org>
In-Reply-To: <20230301215520.828455-3-ralph.siemsen@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Mar 2023 14:54:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEFkg8ZXWveu8Vustv3pToNGRBFwONZKKjQCi16V6Q4Q@mail.gmail.com>
Message-ID: <CAMuHMdVEFkg8ZXWveu8Vustv3pToNGRBFwONZKKjQCi16V6Q4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: r9a06g032: drop unused fields
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 1, 2023 at 10:56 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> Drop three unused fields from the clock descriptor structure, and update
> the macros for filling such structures accordingly.
>
> The values for such fields are kept in the source code, now unused, in
> case they are needed later.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>
> Changes in v2:
> - added R-b tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
