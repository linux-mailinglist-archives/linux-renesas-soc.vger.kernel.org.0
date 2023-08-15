Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2DF577C8B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbjHOHly convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbjHOHlj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:41:39 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B422710F9;
        Tue, 15 Aug 2023 00:41:36 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-589c7801d1cso39286157b3.0;
        Tue, 15 Aug 2023 00:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085296; x=1692690096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvzrsyQ0VeP4Buf8o1bS+U3ITedOgmzxQDcHmxq+9HE=;
        b=gMlz6S4gUNxQbOcVrnbaYOpYESGO7BY8wJU3K0aqEddIZDXhMCnhjNrKgLpVUWnW1k
         dN0L9Wfx087Tk+7w/U499pu0kqwl0PVHCPjxQVrjowSZE/xpcJ72vBy4ia2qgfsx9giX
         eDuaZdvoLnwZLrSLVfg8rMBCKBBs5lC6OpAf8w7LZO/pNJ2ICX0cxy5A+UglciQZxmXF
         vYEjFtTq5BO8KXLQIB5orxbnSmngKrFWQrw97Gq+uNKYqUK095bV1u712gJcLBGd61Qg
         6deBmImXLFXKzWL8BGPRZMYVAIV0/JcW4ICQI6YbJ2ZwUegN8Uq77LAjHHktWCXMlm2A
         OaBA==
X-Gm-Message-State: AOJu0YwtcwgPm29oEf4a4+asJfgMU3YkU7yFaBJaTfzfkxiBqwru5MST
        sEiOE4Kbx2dy0sKRqt3Sjx8psRBU0kDgjg==
X-Google-Smtp-Source: AGHT+IEXCpECbF5jFEvNmGONAeH+GJn7LA9sEzCK/+ivfYTkUVDGmTn7A/5uzrru0bC9ujZBdFI/9w==
X-Received: by 2002:a81:6cc3:0:b0:583:b72c:883b with SMTP id h186-20020a816cc3000000b00583b72c883bmr11759199ywc.11.1692085295801;
        Tue, 15 Aug 2023 00:41:35 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id k185-20020a0dc8c2000000b005773ca61111sm3275636ywd.42.2023.08.15.00.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:41:35 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so4983695276.2;
        Tue, 15 Aug 2023 00:41:35 -0700 (PDT)
X-Received: by 2002:a25:340a:0:b0:d58:104b:d7a3 with SMTP id
 b10-20020a25340a000000b00d58104bd7a3mr11580500yba.36.1692085295412; Tue, 15
 Aug 2023 00:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87mszbpron.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mszbpron.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:41:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+ULVdOu8ngg+BizjHUiEOV+RUQZ6bzxfNCrZMcvLRBw@mail.gmail.com>
Message-ID: <CAMuHMdW+ULVdOu8ngg+BizjHUiEOV+RUQZ6bzxfNCrZMcvLRBw@mail.gmail.com>
Subject: Re: [PATCH 3/9] clk: renesas: r8a774a1: add 922 ADG
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 1, 2023 at 1:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
> clk_i which came from internal S0D4. This patch adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
