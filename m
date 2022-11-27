Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6C9639CF3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Nov 2022 21:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiK0UqZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Nov 2022 15:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiK0UqY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Nov 2022 15:46:24 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34899307
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Nov 2022 12:46:24 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j16so14528396lfe.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Nov 2022 12:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=biw1utCmNyI+ef9futimPqL2qrgw3YwY9eWMD1oBQZg=;
        b=OlV34XTYKDoXKxhSx7XLgHtlh9rmsOunDPZ9ZE20yVN/IZrCWenYWLMZ7iFV9IXlii
         RRhBE12IiZm7fLEwLZpXRMlChpmbyP8Btg5SRYbJHNJCfS5vx3NHjKku4oZvOd0jeGuk
         k0xxyhq3og3ovPEiJqeZlS6Zgna71FNz78chq8v/khMhfiNz+DnkSNI0DxKAsrAQrbE8
         D4S2nvl3y/fE95b/PKErUOskDaBFk/9hjttoA90LY0NlNYw5UfKedRdSlizKEzDO0L5s
         r0XABWvi2uym3DPnQtuzszRv9jSHp49W3B5ZbaFIwN+Xluz4Y33oayqS6CfzJKyp7xLv
         cqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biw1utCmNyI+ef9futimPqL2qrgw3YwY9eWMD1oBQZg=;
        b=5rNHjLJfFibiQT0hBwmX2zu79AX/8jmUPo3G5iG9g1IzKTlQHq9SwZX/2t6H3hPEbI
         BTOgjafGsJnIVzbKW2AKhDxEdz9lkCJx5MQHuYIdtNEWEudxOOxM/pGPigFhnTAYXVP5
         +dCXyvZ4TvvzK0XwEVAMxjBlS+DC09hTUJ0wqvH9FikMl2ol15DhHQ69dQQ5poa/ti7a
         tdywvCdp83TTvtiZhlgdthgbwlw5EXkBuupoucwzYVqYuC0MIKWaFri43ZzWb3TI5Xve
         lZC6eScSBAB+cMjOa4Gm6GMvhWH6hHZREXQHp6zWy4cffd/t7+DrBrEUXpFyw9zOvbc4
         xeyQ==
X-Gm-Message-State: ANoB5pmhuc8pC2ig8oncfAdWyl+n2nZvetDPGKkkgHbus494ZcWO8WMX
        qgSE//FZxWUagQyd598CJz5oGoYVaYwQTxS5KmDgHm1g378kKg==
X-Google-Smtp-Source: AA0mqf7RbIKZu6roK+tO0XMsnJBS47GuTWKXqr1ORzXWJKXo+tkBRPkAzbSScHDbWTgTHN17bfFqfRLC4u84OL8Noq4=
X-Received: by 2002:ac2:558c:0:b0:4a2:4b78:a8e8 with SMTP id
 v12-20020ac2558c000000b004a24b78a8e8mr11950464lfg.292.1669581982276; Sun, 27
 Nov 2022 12:46:22 -0800 (PST)
Received: from 332509754669 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Nov 2022 12:46:21 -0800
From:   RICHARD EDWARD <richardeddward@gmail.com>
Mime-Version: 1.0
Date:   Sun, 27 Nov 2022 12:46:21 -0800
Message-ID: <CAGpQqipABv9FOrywUa9hw+nM2MqAf8OX8URrEqmu990bUh137A@mail.gmail.com>
Subject: HARD HAT
To:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To whom it may concern,
I would like to order HARD HAT . I would be glad if you could email me
back with the types and pricing you carry at the moment .

Regards ,
Mr HAROLD COOPER
PH: 813 750 7707
