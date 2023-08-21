Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F33782B3D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 16:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbjHUOMq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 10:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235670AbjHUOMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 10:12:43 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF63FE3;
        Mon, 21 Aug 2023 07:12:41 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68a3de5f231so705062b3a.0;
        Mon, 21 Aug 2023 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692627161; x=1693231961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmlmmTxwRELj1LPxWYGd3DdzRoueNIJ1haMGudo6hiU=;
        b=pOsoiHsR9iK7xRKQq8aFrdKtM9e0sRUIO2M07W76epMMm/Gd5d9zJswG8ECLPhYiZl
         s0KYRLwDai68C3rEY6n0vK5Wt9463MtyGtGjHvfcPaccfRVkI3WaHutJMpzLHXwHLOe0
         Uytd1MPk7G/gqyExgXL/BiGjPg+A+YtyRwTypuaBqRL0f+Rvww/Gr31+W8ScLrUDgo9t
         glynYjlT/RdmAo+7hRJM1N9WVz/Jm4+lXxOBk+jZxQY/XjFtj32hiZ/h1W0YNUOU/4ui
         mRj0guMuMAcQres2+ykGNDvIrviKAlPc5Vjfw3oPlRjn2CTd0q05R0SuVX2tq6LbvIOh
         Iw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692627161; x=1693231961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmlmmTxwRELj1LPxWYGd3DdzRoueNIJ1haMGudo6hiU=;
        b=HlaJgo/MsCyAY6HEL+Dcqf7kOvceIQ/Dl3ckv0HBG1++JweQTMVMLuF5VOrjNDwVqh
         3jS130GZnLsqO/NEY4SH3ccItetRtOiB/hE3MXl+UtH+Q1CzrGNVuDU3WXlUH5uiN9My
         Q1pbqLRn4EgkwEVoflizXvNqenGHdW5dqFgV3Yxn+ajKw2TxSqyZgSjXwWXr/Hr9Zb57
         53ZrmbFicEQR7A7nlObC9gML2adL/7zHUYcSVCfytDfE7YuTbvxsuWNp5e6/HcgB02Io
         3bRjCuu62BW9DynJYn5BjsVEs/zk5h4sxHmT98RcqdcVWjgOUCVKxd/soUI7GlSu+IUU
         eHlA==
X-Gm-Message-State: AOJu0YzKIAGASoW4QbCubm7a0TtJh4iqxKW3fUVuJX1Ob43FBvTmkAI1
        Ldp8cdtPRamVcLc2z/GU3wM75vncdPY=
X-Google-Smtp-Source: AGHT+IFa6Uddk2ugGOSvMVZj7V22N1pJ21bV4tFjgBtOMQ4dW6uASXTXvSzMibbSgCvmYTbN4/t4ig==
X-Received: by 2002:a17:90a:9ac:b0:26b:2f9:a898 with SMTP id 41-20020a17090a09ac00b0026b02f9a898mr3823912pjo.47.1692627161269;
        Mon, 21 Aug 2023 07:12:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a3-20020a17090a740300b0026b3a86b0d5sm6166011pjg.33.2023.08.21.07.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:12:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 21 Aug 2023 07:12:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: typec: tcpci_rt1711h: Add
 enable_pd30_extended_message feature bit to struct rt1711h_chip_info
Message-ID: <e4c5b89b-2f61-4653-80ee-33cfc32f1717@roeck-us.net>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-5-biju.das.jz@bp.renesas.com>
 <ZONhv2L1DYQ8EEFZ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZONhv2L1DYQ8EEFZ@smile.fi.intel.com>
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

On Mon, Aug 21, 2023 at 04:08:15PM +0300, Andy Shevchenko wrote:
> On Sun, Aug 20, 2023 at 07:44:02PM +0100, Biju Das wrote:
> > The RT1715 has PD30 extended message compared to RT1711H. Add a feature bit
> > enable_pd30_extended_message to struct rt1711h_chip_info to enable this
> > feature only for RT1715.
> 
> ...
> 
> >  struct rt1711h_chip_info {
> >  	u16 did;
> >  	u32 rxdz_sel;
> > +	unsigned enable_pd30_extended_message:1;
> 
> Besides pahole results, the unsigned is deprecated to use, spell it as
> unsigned int or u32 or... (find the best match).

Just use bool.

Guenter

> 
> >  };
> 
> ...
> 
> > +	.enable_pd30_extended_message = 1,
> 
> Maybe even bool?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
