Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD5D72C571
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jun 2023 15:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbjFLNGA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jun 2023 09:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236365AbjFLNFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 09:05:47 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F2F1708
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 06:05:36 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-653bed78635so2914585b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686575136; x=1689167136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16wuC5E5n9j7uBffwe63ixe0QHFCaM/pIPnMy2Ld/VM=;
        b=kr/vjsI3CGieUIBJNSn2kgyrViE2sFHxX+rRLsnYZJ/tNKmvb8POR70m6ji0x4Khy3
         o7t6EiM3bY1GrNveTNwMnRgWzqbE3YLfNdrFMv4ccQSaRotYumYaMv+o3m4w9jaDSxYS
         qX5LbYkGoURkfDAMGyKY2i5h17pbN20bDKFyhd53HSgOHeX6+ia1VtSX9FeB2iox3s6c
         HPcGhxt0MLedN5CgbLBnSeoZ2b3Qc1+8xHXbb2tkUl5KN6hRIy9XfTMtf1KEZOtth9W/
         dP2dy9M51pRHSEZezdRFDFtfSqykW5xu5nUtf2wrNDFTMTVGdTEUYSiMyfmEKZcmd0AM
         0H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686575136; x=1689167136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16wuC5E5n9j7uBffwe63ixe0QHFCaM/pIPnMy2Ld/VM=;
        b=Sa8a/Kx1fRb7RrmxYKRncXVN/j4Q6RMSaDQd/HSWn5hq01BKTa/PgWk0EYgk5jPvJG
         14ZtDCgLkKYaGjfTS0rML4TXsnnQOTHeDY2p6bydelhZb7ZbkJydyxWvB4UWIDGFYwzk
         AhNCr/54+6Lz5n40XGA8flKveQRWZKaouxaapGLwkgk4hV+xBLXaG1V0NlH8Z8k8bzJ3
         BkHIg6tonYvefM8G4XZ6520+giRAhlEG2FWSBSqiwqdI9Cjek3pd3UFsCrErJQfiHnTe
         4wF7XJwt907PLwdVKayll606axETlloHP17nIKBNEgmmmzQoWNWJjNo0hCRTESmHrbZT
         7hrg==
X-Gm-Message-State: AC+VfDyvKHqk4yr/VqiKycPTmW3oJW93s6J+zYh0Unr9DFg1ix767r+S
        vjzhsPcCkFFvwazobp/vnhcRMiD0Sbd4tqMRj0M94c8l
X-Google-Smtp-Source: ACHHUZ41yKHcVE53caf1HM/f36D4XF5L3WUBu5VERzMNWf7qsMKeYo7+0A5TZtBONIfukVyH07wFfd6N3uwGqfDesp4=
X-Received: by 2002:a17:90a:357:b0:252:7372:460c with SMTP id
 23-20020a17090a035700b002527372460cmr10725152pjf.4.1686575135988; Mon, 12 Jun
 2023 06:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJbuvDCecsQfvw4X3a=w-F95j6dQYAj+0irkVhTAQ0abw@mail.gmail.com>
 <afe41e88-4de5-cce9-b280-0ec955b52409@mailbox.org>
In-Reply-To: <afe41e88-4de5-cce9-b280-0ec955b52409@mailbox.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 12 Jun 2023 08:05:24 -0500
Message-ID: <CAHCN7x+e4Nk8qioX_djm=jxm=fmJ9G391JnkxnQAhfVnfmfEqQ@mail.gmail.com>
Subject: Re: RZ/G2 / RCAR3 32-bit Kernel
To:     Marek Vasut <marek.vasut@mailbox.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Jun 11, 2023 at 9:34=E2=80=AFAM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
>
> On 6/9/23 15:48, Adam Ford wrote:
> > I was wondering if anyone has ever attempted to build a 32-bit kernel
> > to run on an RZ/G2 or RCAR3 SoC.
>
> Not me
>
> > I have a variant with than 2GB of RAM, and I want to run some
> > experiments to measure RAM utilization and performance to see if it's
> > worth trying to run in 32-bit mode to save a little RAM.
>
> It might be worth looking at arm64 ilp32 too, that retains you the
> armv8a instructions, i.e. you get the 32bit pointers without the armv7a
> opcodes downsides.
>
> > It looks like U-Boot supports AARCH32, but most of the stuff I can
> > find when searching has people building applications in 32-bit space
> > running on a 64-bit kernel, but I am hoping to try everything in
> > 32-bit mode.  I have build the multi_v7 kernel with an ARMv7 compiler,
> > but attempts to boot that kernel cause a crash.  I am guessing I need
> > to enable some additional flag somewhere, or somehow tell U-Boot it's
> > a 32-bit kernel.
>
> Maybe look at what RPi does, I think they run 32bit OR 64bit kernel on
> RPi3 built from the same source and using the same DT .

Thanks for the tip!  I'll check that out.

adam
