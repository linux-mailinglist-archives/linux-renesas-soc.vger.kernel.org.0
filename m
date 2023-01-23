Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCB4677E1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 15:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjAWOcM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 09:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjAWOcL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 09:32:11 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6F4241F8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 06:32:07 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id d16so9736293qtw.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 06:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StVHsElt+i0TY8HfSQz/lNkVKU2NFVmPFjupO0nf7f4=;
        b=L6Tu0RfRyJ1NLtwOiefPICphLI2ekV6SWFkgprBA4BTfR6G+G9lAukuCz8oaVsp/5k
         HXW5GGNE6NUSyUTEqWWI8oI99Kf6UM1xnmveh5YPKFKH3qKgdYtBvd1xZH78GGei4OIT
         PkV0YPE9LZJpVd6ICuK46OBnjEkmlqmUuLc739GT/n41cFInSEzhjZCl+Hl1c9FEqyK+
         BAXZBTVdDDOdu2y79fiylF2El34EkdyYu8Kr7LEnrexedfYjDHh93qB+FrOrZIisiT84
         5ldNYEst1pbRYz+l1TovZRBur3reuFYdkOCmKgAUydxmVMBhj8em85KnDQ3gLNHKw56W
         EbAQ==
X-Gm-Message-State: AFqh2koE1BMXtfIKQus2X4OR6M7Xr4Mg0QJXaqYrsam3NlnVAnUxl/Rx
        bpmyayUiTvwI7uFVuV+B6fsXQVeznrbfBg==
X-Google-Smtp-Source: AMrXdXuCnwvlSGsAdTrbkc9OOdJ8j1FYJp9ZoL+1griOw8X2MD7DxMz2BMESkZX2yHJIWzXJGSl0RQ==
X-Received: by 2002:a05:622a:2593:b0:3b6:694f:d710 with SMTP id cj19-20020a05622a259300b003b6694fd710mr30356617qtb.50.1674484326109;
        Mon, 23 Jan 2023 06:32:06 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id a19-20020ac81093000000b0039a610a04b1sm24774138qtj.37.2023.01.23.06.32.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 06:32:05 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 66so15001023yba.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 06:32:05 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr1926934ybo.543.1674484325389; Mon, 23
 Jan 2023 06:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-3-tomi.valkeinen+renesas@ideasonboard.com> <Y8q+ad8CxC7LBN4l@pendragon.ideasonboard.com>
In-Reply-To: <Y8q+ad8CxC7LBN4l@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Jan 2023 15:31:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHARDyJnSdOrGJ7aRhZ-Y9K9-NYKYq0orJT+R8fvRemw@mail.gmail.com>
Message-ID: <CAMuHMdVHARDyJnSdOrGJ7aRhZ-Y9K9-NYKYq0orJT+R8fvRemw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm: rcar-du: lvds: Add runtime PM
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

Hi Laurent,

On Fri, Jan 20, 2023 at 5:16 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jan 20, 2023 at 10:50:04AM +0200, Tomi Valkeinen wrote:
> > Add simple runtime PM suspend and resume functionality.
>
> I think you need to depend on PM in Kconfig. That's not a compile-time
> dependency but a runtime-dependency, with runtime PM support the
> suspend/resume handler will never be called.

While technically that is correct, you'll have a hard time getting here
with CONFIG_PM=n, as both ARCH_RCAR_GEN2 and ARCH_RCAR_GEN3
do select PM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
