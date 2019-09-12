Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB558B0E70
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 14:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731439AbfILMBS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 08:01:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40058 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731472AbfILMBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 08:01:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id d17so1251205lfa.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Sep 2019 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/+KUaKRozmj9MhbNeHfmxbGBvkbW3cvd5G+N9N9TBXM=;
        b=GKv1qDnJSNRxPyoVA5mhBQU/+djHCITs/mJgu5UnUu/V/BNM4EkaJxhPIoQiXPK/6/
         lzdLo397iX1mgkC5aSm7IL420wqfqyVnaCzdcEtSmsZW+iH2325tS3398AJve7mRdaO6
         JJjRd5w0yJ6BZz60dwRQ/Ec9BkmgWDYRo9beV/fX8pxWTMw4Chp8RAWzA+5+Ln/9hWOz
         A9A+LBNXviLTBak+0NnUkGKNfaeNfpsaf5/MBd3d8DfGT+bZh0icEpth2XIdJONnM9zW
         7gyYH+X5olhxuE+AniDlfUtPXF86f++QHrAMjmcK9NyTdnAH0Go252exevHp2OhXVzH3
         /Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+KUaKRozmj9MhbNeHfmxbGBvkbW3cvd5G+N9N9TBXM=;
        b=lA2PApii2qSVxU1yw0Ly3MeDpSYQP1onY1FEg6C92TpSoOxULjJGDWEqCzN98EMy7D
         FQEqsWVeVrKydpzj8Y1DNJkC9am/07ePdDzDW7YR6XwGsmo1HaHnoxKb73SkH3IU2GgV
         Q1PZT620aeV0U0MEMKhxvRJSZtcI2BFI8QYJrXyplhGCvemZLL73NcNfZQa2uBqajBU3
         Fr1s7vK85uLOhvWk/G88FyvvmXxNFFr0puXHLjxDb80J+CKEnnY0eKKzx2Q//qe8W6Ee
         2hTEPjkglO84DJLMkPasBzC4NrExQzEs1O+/AG6iM3Wh1XPJBOk+C+PqgThcIZtL7s1h
         YIYQ==
X-Gm-Message-State: APjAAAXrS+FvnHyjW95T7473iGJc5Mtw+mUOtR1raWhfhtbVzEJoRuCZ
        Jo3nyno36dagmLuFWtgqsgoEv6yDE9DGGrFG2nk0dA==
X-Google-Smtp-Source: APXvYqz7TmCb0iFOGja4A3HJL4YEW41PboaxDwufY4ujKzw1ClTCCkOCVi7WXFPfX/pILiG588HXmotxuzPvBcWEELg=
X-Received: by 2002:a19:117:: with SMTP id 23mr27924292lfb.115.1568289675144;
 Thu, 12 Sep 2019 05:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190827093927.GB8443@mwanda>
In-Reply-To: <20190827093927.GB8443@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 13:01:03 +0100
Message-ID: <CACRpkdbG0bz40U8qFSvi6ds-8XiUSX+yj1uC4XynyAfJWfantA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Unlock on error in sh_pfc_func_set_mux()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 27, 2019 at 10:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We need to unlock and enable IRQs before we return on this error path.
>
> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for v5.4 with the ACKs.

Yours,
Linus Walleij
