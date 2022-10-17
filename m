Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB00601842
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 21:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbiJQT5s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Oct 2022 15:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiJQT5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 15:57:48 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D396C125;
        Mon, 17 Oct 2022 12:57:47 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id f22so8440285qto.3;
        Mon, 17 Oct 2022 12:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vecsSImB7VM4kEO7HXPMFlgdb9IGl9NsIzJvklmJ2c0=;
        b=jjQ2VWEqtqG1xmPQRlUZdXnVx8u1xwJ6bzsvl/kGmdpoCnR2HXHx55xrCnqPJkd43a
         TrFIOTtEyBv0dnxvC9UEHQ/kMVabdmE7IdIMCRZPDoDGhQfpTw05vc/isw0lx6/6XnY6
         GADPknRfd///gvUxnoy0GWdxjIJx2WwhX/DLyF/vVMbbq8AIJ0+F/DjIjrQWTbSDa1Z2
         fHpVzMSz4D7XFFXSvtzObUxfgCLxGVo5pmh5bMVwjBWL1+0UMOqtHu8l61UC/2b4t7MI
         lsKAcNYv6vVHI3O83e90cNSSEzYWNaO0J82tZD7j5mbIV9Gw6ZcF0vEvEQSC7EuHf/XC
         e14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vecsSImB7VM4kEO7HXPMFlgdb9IGl9NsIzJvklmJ2c0=;
        b=aLSEzwVExdCqCMW7ZxqMfs1iVPg04zrlmR6CJylDhX0pdmUkbuPq7wKmoKuu3KwD9V
         u70lQnM0AB8cE75TFomPIuHcsZAdhvK3hBf61rdttAfXhImDVtp+st4QiqT+3t87O1ak
         7fecZMH6V7wtX2WkqwhX7/XBDyWMzZZ4yw1gQ85IVY3EqtQluOsD5vf3xMKK3brvz3yn
         jHy0AZrVsw1sK8hLtxS5BjjrwAooCyWB/zP+OVU45z+2BicUfP4foEZywLZ3iCQCV4bS
         h1kvwQBPkp4rJbI0zski9qMSApofV4xyBR9JL8P9Ud4NrVvFI8Ll1Xb0pGi91Z/jFByy
         AhyQ==
X-Gm-Message-State: ACrzQf2JsXbFrgoblvUye9VkRIjdM9igJoQpBhrCVQZ1IEdhf3YMH6cU
        Y25G2YwM0le0hIgwJdBtn5OtMUiGrmY=
X-Google-Smtp-Source: AMsMyM4yUcQUOFSda49KdtrtMThH2R7nm3rGO04bA7gE6P7w6/bOP83Ror6KomIKAUMk58JStLzSbg==
X-Received: by 2002:ac8:5a95:0:b0:39a:86a3:5032 with SMTP id c21-20020ac85a95000000b0039a86a35032mr10387517qtc.96.1666036666552;
        Mon, 17 Oct 2022 12:57:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id bb4-20020a05622a1b0400b0039a275607c3sm445168qtb.55.2022.10.17.12.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 12:57:46 -0700 (PDT)
Message-ID: <2bf27c7c-8107-7ddb-a485-631c20de2a19@gmail.com>
Date:   Mon, 17 Oct 2022 12:57:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] ata: ahci_brcm: Fix compilation warning
Content-Language: en-US
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        linux-ide@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-renesas-soc@vger.kernel.org,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
 <20221017032205.2210188-4-damien.lemoal@opensource.wdc.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221017032205.2210188-4-damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/16/22 20:22, Damien Le Moal wrote:
> When compiling with clang and W=1, the following warning is generated:
> 
> drivers/ata/ahci_brcm.c:451:18: error: cast to smaller integer type
> 'enum brcm_ahci_version' from 'const void *'
> [-Werror,-Wvoid-pointer-to-enum-cast]
>          priv->version = (enum brcm_ahci_version)of_id->data;
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fix this by using a cast to unsigned long to match the "void *" type
> size of of_id->data.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Acked-bby: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
