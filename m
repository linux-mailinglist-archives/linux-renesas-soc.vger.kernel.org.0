Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515184DD876
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 11:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbiCRKyD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 06:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiCRKyC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 06:54:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8422D4D4E;
        Fri, 18 Mar 2022 03:52:43 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u23so6655045ejt.1;
        Fri, 18 Mar 2022 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cmRyc1i4zTT9JhIhbJra7/fAc7CJ0O3rKCVZUptpSnA=;
        b=QSG4V70aEkbKs5h1yKVtkiAzok/dUwV0YkAWbYj944YOZRVk+NCamQDuRvuQAilt5C
         Z/w62u9Ouf1gi4uzasYTjrNfZwLfzmegiFB6w1EJe6txdE6Yc0kVmZuSAIVRLlg2j1im
         qdboRECATBqo5HUxlJDmByhQMhxDXXSI0P1FJMcqGss1C5xRotM36bSYdWPJOyYTEKQ0
         Q6N+Aga/NMQGkxEbG5uW6XrPQkGkz1nFa6mGCkGccCoUpkM6HnLBH8rozuW4UOhOXB4H
         rirF2kOyQC9MUOB3vbLqKIbbMOuz55NRhdyCLkORFwbNu/zNPsLJG/VCN8aRWmmmHuzw
         evgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmRyc1i4zTT9JhIhbJra7/fAc7CJ0O3rKCVZUptpSnA=;
        b=lYPsTjObi4DiZzfH2LwLNJW1+Uoi04A1xn2KIiBc32xOAO4WVZlx/PsK3thKfquwPG
         STqQY74Z/2yFJ0cBvqjdceA0aDorPmkIo6XfZM/n8vpx5S4eJZ71Ri/QWAVfrm1UmtdN
         Yswcei+nK4W9aqv2O1+dTdE3abLrzn9/1lgN05jIJ4XS1+LDyv/ZtU51H06+OpnWLE6f
         sd+GYcDe3i3HNwlL/8gfhwKTPJXZhDOBxLIkT3J0mSn+Y/02GOdIf+9jFi1tpgMLt9Di
         SkC7gs2FS/C4Fff6Vb9G3EcEM+tn+dpMte+yfKaDfu+Jnem700fAYEKLsBPkPASK7aPe
         GPlA==
X-Gm-Message-State: AOAM531ujz9bdJbpsINgofGo+NRxpFMtJOZFByi75iIkxA2wWpMzwupE
        T4onm9JYZZ+Vhvz/V64MG6djRRBoIJyZ+jUddYY=
X-Google-Smtp-Source: ABdhPJy1bmhUdWHHrDILakB/pEMzPeurROPFcxHe7XoceumLy/XOf+ZKpIscQV/GvvZbMVpdU+yZ7e35O/TKiMzbHcc=
X-Received: by 2002:a17:907:e93:b0:6df:10b3:4fc0 with SMTP id
 ho19-20020a1709070e9300b006df10b34fc0mr8582505ejc.44.1647600761919; Fri, 18
 Mar 2022 03:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220317174627.360815-1-miquel.raynal@bootlin.com> <20220317174627.360815-2-miquel.raynal@bootlin.com>
In-Reply-To: <20220317174627.360815-2-miquel.raynal@bootlin.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Mar 2022 12:51:29 +0200
Message-ID: <CAHp75Ve-PbTMBdb6Y0TYdaOMDwsJ_2JVoKCkwCFBG=iUd8baEA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] serial: 8250: dw: Move the per-device structure
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 17, 2022 at 9:56 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> From: Phil Edworthy <phil.edworthy@renesas.com>
>
> This structure needs to be reused from dwlib, so let's move it into a
> shared header. There is no functional change.

...

>  #include <linux/types.h>

> +#include <linux/clk.h>

I have mentioned forward declarations.
So, this can be simply replaced by

struct clk;

> +#include <linux/notifier.h>
> +#include <linux/workqueue.h>

> +#include <linux/reset.h>

Ditto.

struct reset_control;

On top of that, please keep them ordered.

Otherwise it looks good to me.

-- 
With Best Regards,
Andy Shevchenko
