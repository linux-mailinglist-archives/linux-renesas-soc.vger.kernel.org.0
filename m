Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAE4729BEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 15:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238810AbjFINso (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 09:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237994AbjFINsm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 09:48:42 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3225130F4
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 06:48:42 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-558cb7f201cso1159468eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jun 2023 06:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686318521; x=1688910521;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DmYVsQ6b/6Rq2HuK+sfLtzB8MAxE3kMu428WTZ6WQDA=;
        b=pIdDRCWwR6apZzGWpKFbuKo5FR7//KnruEFDyLvRj8KHynm+STa19Prvi4S45/l5mQ
         VKuyAFL8LGqfkXDk53dkIEIUD8UWMn3+ihp1rYsBQuvDQIuSVFtNlwXbMEhQwIfjvmBU
         cLf/am7untfDb1OaNi79AlfMnl5SPcrvPXB9XHzUE+SWhiUb+3h00PFYTnMzj4jb0iVQ
         nlFdFpIy7s6w/pe5Lv/oGpLqnWWpnrdkfsBy8smhGWBi3mrHYgzWdIJazRvuHHV6iEqs
         lp3FchHCgx643awlBvlAGxf8qI3rN9cp8Ky/aCYjoR5S1K191Vvyg9py0T74rPgtHua4
         xHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686318521; x=1688910521;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmYVsQ6b/6Rq2HuK+sfLtzB8MAxE3kMu428WTZ6WQDA=;
        b=izuM4XuLwqqCFoorWiU3/5aVIPAHhlG3Xy64hvF3sjOWnHypuQDT1eWfHlnXNJuk0v
         sU43zSFTFw44Rnld3R6SrgyYPxtDhWt6JAzTI6VjT4j3UsWjV64+SX0liPdNcudWHX8v
         l+gAlw8sZ6i2r2Zmf8kkFjyWlTbl4uFZGGpdmyR2MMHYykzi71EBm6dAQsIEgxoS7daF
         leP/8tEakI7xuiJSBCAVwa9gSAFHJOkFSqetmvuBkTQ5apIRhF5BtPSLJMTY1Pv7Ro8V
         Su1Nh4tpi0rNrMS8EoFtliCu613TP7bjvgOe7JNi3pzfFkMsp/9ywgI4g3StJNlOUmR6
         g3Xw==
X-Gm-Message-State: AC+VfDzTGFHzHkhUotcDlKSbYI3hGGEsfRV/1+Zp6XQMOCtgArNZUVzA
        3DxHvNf3fCbFAoBEQmcFrMIZvMdXRxIQvT9b2GQkhjFI
X-Google-Smtp-Source: ACHHUZ5tNIYCpjrcahrgaFkpCF7eSITvZIxhsyiutsDotsp05UDCDRBON1wVvK8kirAH+0S9nQ706y5ghO+xaCUKRRw=
X-Received: by 2002:a05:6808:192a:b0:39a:9e6e:9a90 with SMTP id
 bf42-20020a056808192a00b0039a9e6e9a90mr2046284oib.28.1686318521379; Fri, 09
 Jun 2023 06:48:41 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 9 Jun 2023 08:48:30 -0500
Message-ID: <CAHCN7xJbuvDCecsQfvw4X3a=w-F95j6dQYAj+0irkVhTAQ0abw@mail.gmail.com>
Subject: RZ/G2 / RCAR3 32-bit Kernel
To:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I was wondering if anyone has ever attempted to build a 32-bit kernel
to run on an RZ/G2 or RCAR3 SoC.

I have a variant with than 2GB of RAM, and I want to run some
experiments to measure RAM utilization and performance to see if it's
worth trying to run in 32-bit mode to save a little RAM.

It looks like U-Boot supports AARCH32, but most of the stuff I can
find when searching has people building applications in 32-bit space
running on a 64-bit kernel, but I am hoping to try everything in
32-bit mode.  I have build the multi_v7 kernel with an ARMv7 compiler,
but attempts to boot that kernel cause a crash.  I am guessing I need
to enable some additional flag somewhere, or somehow tell U-Boot it's
a 32-bit kernel.

thanks in advance.

adam
