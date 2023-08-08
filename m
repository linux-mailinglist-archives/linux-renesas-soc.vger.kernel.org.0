Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59CC77416F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Aug 2023 19:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbjHHRUf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Aug 2023 13:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234031AbjHHRUM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 13:20:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F961DD3B;
        Tue,  8 Aug 2023 09:08:07 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so9191442e87.3;
        Tue, 08 Aug 2023 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691510874; x=1692115674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYpXHERbytP8f76n5u1gZDzz4r3bl6ejOhKXKpWtnKY=;
        b=YvZzgLNYmXceCs7wjkM4vm1j58GQPDEMnud74TQ0YkYBWG0mzqwdDjkVYT+7X2tCx1
         IAy5acNTsBQUtqP30qD6Rk+gtq1Z0d7TkAwXHm+rEDkAD49UwnQXMLPVj99NWbvTSZBr
         meei5WaHahczC9Fru97yEjHyck/00h1iT2xTNWOznrMIE1dHGiVrVgaKHfaqZNqDSgwt
         8kol6vz4JrfyT5/a7zmeMWCnaYeXLZIFWLqixYKGA1jdh6GvBaLmSz8Mv3X2P67UkeC3
         Lj5n2e75c4gFt0+Xn9U7B+ARbzf45Q/Gk1eHRiRIWgDGOEbhc57PmqYly0wUTcUCBJ4m
         V2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510874; x=1692115674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYpXHERbytP8f76n5u1gZDzz4r3bl6ejOhKXKpWtnKY=;
        b=DMaLROAhOt4BTodEVbd5MU0vSernfeErWUptWAr2BXh/nvusCJDstzoi+IuSdYMEEe
         CYzlW2Uw3gGYai/b20eyLmUH+Tk+oGSVTTtFByXkkCR8POw2ITohDaCg8rq1XuVwFY0d
         sHJeF99e2k1sJwtZnPg7OI7bRmHhQoV/NYGeTL4oh1mhYfGkh+ztXs5FODRTFuTrTyW3
         Ts9t2J9SCWBFaSt9jT6UCvfaBm8KOv8xslACXCQzapN7ZWOGPiVVTzfkz5M4SvufzHj+
         W43pjS0Ra4fQf5qgoWV1ahLK2kNNlXtHXlg1oAXbQb8Q3fCT5CM3iUabDY4f/CP9jwNz
         AvcQ==
X-Gm-Message-State: AOJu0YxW4PBUXoWbV0aygcftlIjnXNTZyoN+0LMIeBhQxw6cVQmyy2Br
        uwtsGVOZZqjCQ3cKgt4DKVBBdLJ5vJWOFLX2
X-Google-Smtp-Source: AGHT+IHqZX5+i2tEw07zhkT2FhkqK/GmHYgxbB9OmZLX/xARTqjJQuHqNPFP3PyDgOT3RoEkND+lDA==
X-Received: by 2002:a17:906:8a53:b0:991:cd1f:e67a with SMTP id gx19-20020a1709068a5300b00991cd1fe67amr9967570ejc.29.1691492098592;
        Tue, 08 Aug 2023 03:54:58 -0700 (PDT)
Received: from skbuf ([188.27.184.201])
        by smtp.gmail.com with ESMTPSA id v19-20020a170906489300b0099bd1a78ef5sm6470175ejq.74.2023.08.08.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 03:54:58 -0700 (PDT)
Date:   Tue, 8 Aug 2023 13:54:56 +0300
From:   Vladimir Oltean <olteanv@gmail.com>
To:     Xiang Yang <xiangyang@huaweicloud.com>
Cc:     clement.leger@bootlin.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, f.fainelli@gmail.com,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        xiangyang3@huawei.com
Subject: Re: [PATCH -next] net: pcs: Add missing put_device call in
 miic_create
Message-ID: <20230808105456.3vbw3ijqube2yetn@skbuf>
References: <20230807134714.2048214-1-xiangyang@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807134714.2048214-1-xiangyang@huaweicloud.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 07, 2023 at 01:47:14PM +0000, Xiang Yang wrote:
> From: Xiang Yang <xiangyang3@huawei.com>
> 
> The reference of pdev->dev is taken by of_find_device_by_node, so
> it should be released when error out.
> 
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
> ---

Also, the patch subject prefix needs to be "[PATCH net]" (indicative of
the fact that you want it to go to https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git)
and not "[PATCH -next]".
