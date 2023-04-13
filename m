Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFF516E061D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Apr 2023 06:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjDMEtB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Apr 2023 00:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjDMEtA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Apr 2023 00:49:00 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582864EFD;
        Wed, 12 Apr 2023 21:48:59 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id gw13so7721479wmb.3;
        Wed, 12 Apr 2023 21:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681361338; x=1683953338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+h42QyBVa53yPddmSKh7iq2A8MWhipGEiLZVqC1LKgg=;
        b=ps9wtonlNT+tqY6TnsClhzAiAFtm3I0dacG0Pf3+5Ea90bW0vUhcbUOgWM4/MjQgZ0
         bJUhetmII/Xvt0ZtxRzJoIgRvoL7n3qZaqbUODZlvrQuwjl/DFBYNy2s8Uu3NmKhNuMr
         M5ISVU2SW2Y3vV4+q9zCAgma3aIqvlMlM9jvcpvFLoaCk607EprsYCvkjR0u1B4ul7jk
         8dZdQB0gQyQDX5CW/cOYxUk7rl8gJkNCLhyHMQ+/NjIbfvyDNTgmf8L5O2QEOvJlfZ/S
         mgVLTQaBzcmBX3rCcWAA+L5jgu8e2P0KFnOaTUbvQERBHqc69nPq81XXmWecRZXUk3Ei
         qO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681361338; x=1683953338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h42QyBVa53yPddmSKh7iq2A8MWhipGEiLZVqC1LKgg=;
        b=EZlSgzIX0pT7PaALCsUkxP+RusYOLrCGda1v4CLOyT5ufjElStfSnixrHBvhafUJPr
         r0uzl2nv3sYkfJoy/Y6BrPKNmvQ3A0lXEf2J2uPVZL9DkNgFDXPlSePFqZzCl8qY53FS
         7DwkFXEB9i+XDzFinD63WaNhnMMO3azZwcRtnGHK9aAp6LFMtOBmp5yRAAUmQ6SVo61U
         LU+BCJ79gZBjP0Ym/+kX6DSTqQ4fyepRFKTXV9wJZpfuM9rABMpAuAIs784GzWWfPuge
         wgMWdfrwHJB0yRX7VmttnoSi3egXxW2j7K3LRk9dF0VXj7KXWf5YIZDAweO5776tZBHc
         Ggng==
X-Gm-Message-State: AAQBX9dcPqwyIXs3c34pGXGaHtUQnuEYY38fG/GA/4i3oUIW/PcLickr
        bvWiZtf7sFQytettyell8LSpxUO/e/I=
X-Google-Smtp-Source: AKy350ZuLAek0YDbiXQwQIpxy8KrdVL0lTtYEuVRUNTMywF3J9qspljASA407X4sJvJjyVkVSdOAsg==
X-Received: by 2002:a05:600c:548a:b0:3ee:782b:2e31 with SMTP id iv10-20020a05600c548a00b003ee782b2e31mr335818wmb.9.1681361337644;
        Wed, 12 Apr 2023 21:48:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b003ee1e07a14asm4271085wmq.45.2023.04.12.21.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 21:48:57 -0700 (PDT)
Date:   Thu, 13 Apr 2023 07:48:54 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
Message-ID: <dcae7c28-89b5-4f3f-b13b-1a1dc5779d1c@kili.mountain>
References: <20230404090823.148226-3-biju.das.jz@bp.renesas.com>
 <7351b44c-f577-4df3-a01e-e9b1039fa928@kili.mountain>
 <OS0PR01MB5922390F504FC1F51F3B4025869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922390F504FC1F51F3B4025869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The divide makes sense in context then...  Thanks for the explanation.

This check seemed like a useful thing and found a couple bugs but it
turns out that condition divides can be the most readable thing in
context.  So it maybe has a too high false positive rate.

regards,
dan carpenter

