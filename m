Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7983788BB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 16:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343659AbjHYO36 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 10:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343915AbjHYO3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 10:29:45 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBDD1995;
        Fri, 25 Aug 2023 07:29:43 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so835703b3a.3;
        Fri, 25 Aug 2023 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692973783; x=1693578583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTXWmefAxL/7rw5HDKxNWuL5Xr538rX+4SeTiv8Nx2g=;
        b=kZBzzZDtC5v6mG046blUvHHvssCDlMfRQDryjQhhB04DLNCzuyEL2dZVshqJ65bJ+S
         tPvPX5W8XsnOJcwvaNDq0Yt9HIKkzsHu7M8wzJv4EFscOi7eT4xIdnPJMFWuhZfLwq1W
         nus0zZW/0DPH2oZmYV+/f5Ih65E3fRWRnxVGBRb+KceRRtibq/44z/f8Kwj5Iseq7gHD
         OKczqCl4J39TliFy+IqzkHsETMoxO0AbaeFI2PFqyH/reo1Oyd+Mmj8iGd3YfeUSKHYL
         OyYZtuYxoK5Qd81qPSRcBir8FxCPj/YSud8AJeKOxcjm4qk0LA0LZzcKKSIW9CWC9F4u
         UHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692973783; x=1693578583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTXWmefAxL/7rw5HDKxNWuL5Xr538rX+4SeTiv8Nx2g=;
        b=J5KohamiU3zsHUBt+DSXre2JWVbHz2pwpJgXXqb1nPHsphOMdaTFB6GhxBu+ijx2H8
         HtFKKx25eUDgow2RDv70PV8pPGSsCliX6VlQSHV/guH2p6s+ANxM/+TIhIAFf9OehtpH
         W0/QhFsdjOdTA+eTF2BB7O9FtBj5e+LdGhmf7wZybSEl3algRF17DSNaaPWruTR8PpFx
         mvqGxk5Ugk653qSBcx8m0NZgXH/ce/7Zwulh+jfvTFiZcNRJQ3ShTTzh09D8xZ62EQHC
         QxZRY1zZIg6CrNdEIzVd7amOBIkYpnfICEu8KClKuT7SjREDlmfe9ZfGj9W0vJyFnXk+
         SVow==
X-Gm-Message-State: AOJu0YxYlHn6XP/E1HQNH4TPvN3tUCrpQmwUwjMktMoe6WSYNeQ4sG4Z
        iohesskCu3EjGRkBDMo0fJtyKBYnSTM=
X-Google-Smtp-Source: AGHT+IHdRNfrK1Qmd0lUIkmUBZKdUIl9Q7GPWYf1g4kOHX2bBYJ/4hBoSeu/O/Wl14x0vGy/i+24uw==
X-Received: by 2002:a05:6a21:279b:b0:137:a3c9:aaa2 with SMTP id rn27-20020a056a21279b00b00137a3c9aaa2mr17566747pzb.30.1692973783331;
        Fri, 25 Aug 2023 07:29:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0068beb77468esm1633322pfi.0.2023.08.25.07.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:29:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 07:29:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels
 in struct tmp51x_data
Message-ID: <5a3c48e4-ade8-4563-be75-f594be68cf2e@roeck-us.net>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-4-biju.das.jz@bp.renesas.com>
 <ZOgQ2Fc1J8V7rdm4@smile.fi.intel.com>
 <OS0PR01MB592292B941414BF452B14AB086E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <258bae5d-3602-4625-8ac1-375856d9b334@roeck-us.net>
 <OS0PR01MB59224BF249A2B17ADC6EE23686E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59224BF249A2B17ADC6EE23686E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Fri, Aug 25, 2023 at 08:01:49AM +0000, Biju Das wrote:
> > >
> > > You mean split this into 2.  First patch with just this logic (channel
> > > >= data->max_channels) and keep data->id in remaining Places and Second
> > patch is to replace the id and use max_channels instead.
> > >
> > 
> > There is only one field available in struct i2c_device_id.
> > Splitting this patch in 2 seems overkill because the first patch would have
> > to introduce code (set max_channels based on enum tmp51x_ids) only to
> > remove it in the second patch.
> 
> The plan was,
> 
> First patch will replace id->max_channels in the table
> and will fill the id based on max_channels and fix the logic for invalid channels.
> 
> The Second patch is to remove id altogether.
> 
> I am ok with doing it in the same patch. Please let me know.
> 
Same here. You can try with your two-step approach, but please do not
introduce code in step 1 only to remove it in step 2.

Thanks,
Guenter
