Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A8C6E58F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 07:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjDRF7k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 01:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjDRF7g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 01:59:36 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AB359DC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 22:59:32 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id sz19so13165668ejc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 22:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681797571; x=1684389571;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQlu0Oc2Q0nPMBCNq5iTPUZpwrRZlsMdPt2zjra8+VI=;
        b=h2u+IvYIbnFxxtQG/ZtOJXOGODtmHZE6DE2kphmV5deUhBtI5SSl5ZpPS81I4DoyvM
         cL/QsMoq/nZ79QoTUVBpjigDCpbkhNV4ihdOYSWAZCOke9dA/QR1VB/koOlQ9LVEDYMX
         XtbtlwSc8k7WA+c3R6xpugIUkMv4IcvxiBX5jugHOkE6bIQRd6XIP4bPoYTYUOtLJ8cY
         jqOSy7VahCSY+50nHqKMLAvtMY0jgSKZG9RLZ0VM4rlX3dlYAIwPmpAZEs5sdE1jKPzt
         sUSa+Yt3rvdogEL685HX9OzzgKvbxUuLxSFiR0ubii95w3DTWRmDDneYGKBqJn2l6obd
         7Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681797571; x=1684389571;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQlu0Oc2Q0nPMBCNq5iTPUZpwrRZlsMdPt2zjra8+VI=;
        b=U8OEpgHEmpLCtKBnVjOWCOl0qaM93VWHd3WkFh1oIIScczd5PYc5nzz18ssmlrezBG
         eF5g8fl31qhoAbf7hDyT+Uf4CA7M4tzayBdKv5MiL8+AkJGlzh6XfHS9QH8ogMjmuKY/
         KCFdsn2GnArtWXnCabS7Oi2p8WGx24D+xBrLBPfNSq0Qwgc7HJ1JCs0cr9+iZfvbflpd
         ATsZjs7iKBcBqRS3uF3vdwPbncApXNwkd2lPiwAwZH16RSBFQ99OY5wQKomV3ECp2EUE
         qfss2/0foFjlw9QtLs26LUyb6rgCXhZUXzvCsuqRhoCTLoeCQZfSk3iIa/z2Ox2ZcXSS
         oS3w==
X-Gm-Message-State: AAQBX9cv0dwE5aXFl1yDUJyywiXJJcz1Hsq1p5NoOL/2HgwUfC5Sp2No
        i0N2YcF39ZkF+4qtBW8Lc0PqyJRk6Pv4dyLWRiALiokWTS60vTYr
X-Google-Smtp-Source: AKy350YRsUSKQ0+i58Lzun7WtY7IrRwSkm+DWIi2JdfS71rVYYWUT2OQ/a/Q5PRWIBazn3AQLm2dWBYGVxBajLvvRoE=
X-Received: by 2002:a05:6512:96b:b0:4e8:4b7a:6b73 with SMTP id
 v11-20020a056512096b00b004e84b7a6b73mr2935594lft.4.1681797550844; Mon, 17 Apr
 2023 22:59:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab2:2681:0:b0:1b6:840f:9075 with HTTP; Mon, 17 Apr 2023
 22:59:10 -0700 (PDT)
Reply-To: mariamkouame.info@myself.com
From:   Mariam Kouame <mariamkouame1992@gmail.com>
Date:   Mon, 17 Apr 2023 22:59:10 -0700
Message-ID: <CADUz=agNY633M0qMXMnAP3Ms7-3rKuWtAZGCOQZKeYpCdBxT_w@mail.gmail.com>
Subject: from mariam kouame
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Mariam Kouame
