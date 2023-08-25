Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE57788BC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 16:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343722AbjHYOcE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 10:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343794AbjHYObl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 10:31:41 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC968E7F;
        Fri, 25 Aug 2023 07:31:38 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf7423ef3eso7540175ad.3;
        Fri, 25 Aug 2023 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692973898; x=1693578698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXNd0JA4M6xGrrZb9fHKfxYGuaZv+5t54lzWlN+dLy0=;
        b=AGg/pu17DzvitI388Fq1Lx3dUAI500mT33tf1bFx1AM4fYxRDDP8yyZPTQQOzcWX5S
         YPkfU1CqjnJIV6xw622Sgn7FFbG9+PGCn9HDzL7+rbcu5NvAiWu3CGevTnPLiXhgkjHm
         yjx5Je5jSmlPBvgrz2cSPZ2izPr7gn+sMxZj8gXpZwgrQcppf/sZuVMQhD9nKmdoF6ab
         RWmVugKN38BxkahX8mCZXJ0LmkFTIroY3rXuK5335wAHThDLvcVkfRazqQA60nGuaJ95
         0TW+Bqaf/E69K7q8SYkY98F+eJTZRA+lHPQKidwchc4fcsLYqtlMQF/TxCJVHT1aa+XN
         iiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692973898; x=1693578698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXNd0JA4M6xGrrZb9fHKfxYGuaZv+5t54lzWlN+dLy0=;
        b=Uunwwdczix03VFhq4znD+q4djGds+T9esg5tk7Mq8VV49XekeDb7+lJjwmJHsTUxdz
         NIDOfEhdkvi7dVieuIHpVuicRVi3JAzrbTUkBEL9VRXycp5qerDHihwUUNKAZb2XQZ7+
         edt5oW5BB1MvJ1wLNJNqBeohp2zNqV7pbhH8fXpFXlnKAPABOol8EggDhDNxAowuYema
         YPGWG4vFwo5mTEi9u/zT7FeAyb9/rmbWo5PUYKyeyRKp9BBEINNCbIaGTlil2n+ePvkD
         3//j3gtBz0aUGZPaQytiIxOBaQqA4QVF0q5vIay3to3kxgAKJHIFGT00pvmc0sZCpPm7
         9n2g==
X-Gm-Message-State: AOJu0YyLN24HGX0/rnMStsA/AOEIRI6VdcRYKAujzHjU03QDI+EhE4E4
        Zb8RQOeLrRDbE1iB0l7uOwA=
X-Google-Smtp-Source: AGHT+IEciOPT9LmrSnAXKjFIeeEub8sXO5ERbvPOJS8e1zd2UmoQdejgfUpplUC0Wc75FfCyNwVKNw==
X-Received: by 2002:a17:902:ab46:b0:1b8:3786:3344 with SMTP id ij6-20020a170902ab4600b001b837863344mr15004217plb.49.1692973898208;
        Fri, 25 Aug 2023 07:31:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id iz15-20020a170902ef8f00b001bc6fe1b9absm1762215plb.276.2023.08.25.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:31:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 07:31:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels
 in struct tmp51x_data
Message-ID: <e3bd21a2-a63b-4455-95dc-b1c959efcca6@roeck-us.net>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-4-biju.das.jz@bp.renesas.com>
 <ZOgQ2Fc1J8V7rdm4@smile.fi.intel.com>
 <OS0PR01MB592292B941414BF452B14AB086E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <258bae5d-3602-4625-8ac1-375856d9b334@roeck-us.net>
 <CAMuHMdX8uBnnofkpVZ93318FRaNZ32GfNg3rh6NR-KBR1LJx8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8uBnnofkpVZ93318FRaNZ32GfNg3rh6NR-KBR1LJx8Q@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 25, 2023 at 09:43:24AM +0200, Geert Uytterhoeven wrote:
> 
> > > > > - data->temp_config = (data->id == tmp513) ?
> > > > > -                 TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
> > > >
> > > > Are those still being in use?
> > >
> > > Nope. Will remove it.
> > >
> > Not sure I understand. The above lines _are_ being removed
> > (- in 1st column). What else is there to remove ?
> 
> The actual TMP51*TEMP_CONFIG_DEFAULT definitions are now unused.
> 

Ah yes, sure. Guess I had trouble parsing "those".

Thanks,
Guenter
