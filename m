Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE4E7A98AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 19:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjIURv0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 13:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjIURvL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 13:51:11 -0400
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EB66979A;
        Thu, 21 Sep 2023 10:30:47 -0700 (PDT)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id D1E68EB7;
        Thu, 21 Sep 2023 18:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1695312101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x+jXaho0ZIi9BmaRxov9GWSa018Ii/NEh3JmcH5ERxw=;
        b=qVyNtZ5S6BtOrh3RjVNbJiLuOOkn+zfCRAkBZlicq2gMlcAB0BFZZS5+HRIUy8ERhSunHl
        yq+Q8qXwUYyE+gU5vWBjpDItpp14+6Kw2u7OKKeHd1b4QY9VA2cLr/ftGySxI376w0C0JS
        GO57lYZJjfW45ZgV0QrADEcowxA2r8DV9bKICzSM/vr6mVWSkadgnqWDR0VGFZXEVVlyqp
        1qBgcZTEmUrd4Dziqxd7QBj9PI3Ms9xa60BvH40HLlVh/TJEgLjF9nIYZOiWf71kXmDQpK
        iLv79GMv0NUL9Q2zIMyMO4ZGPGd52Fxa1qqNJjV+Lr5c5/cRg9iETzGyQMT/1A==
MIME-Version: 1.0
Date:   Thu, 21 Sep 2023 18:01:41 +0200
From:   Michael Walle <michael@walle.cc>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Tudor Ambarus <tudor.ambarus@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
In-Reply-To: <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
 <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org>
 <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
 <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
 <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
Message-ID: <d4d998cff934328f58cec767f93a59b5@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

>> We won't break compatibility with older DTBs if we use a list of
>> compatibles. First the vendor specific one which will use some quirks,
>> and if that's not available, have as second the generic jedec,spi-nor 
>> to
>> fallback to.
> 
> Sure, you should use a list.
> 
> But the current recommended practice is to not have a list,
> but just "jedec,spi-nor" (using a list with a new FLASH part name
> causes checkpatch and dtbs_check warnings). Hence if you follow that
> recommendation, you will run into compatibility issues with older DTBs
> when you discover the quirk later, and decide to add it to the list.

The SPI NOR flashes should be auto discoverable. Why do you need a
compatible string? Quirks can be added to the flash_info database.

Also note, that one reason *not* to add a particular flash compatible
is that they are usually interchangeable and OEMs do so. So a where
today a board might have a macronix flash, tomorrow that board might
have a gigadevice one for example.

-michael
