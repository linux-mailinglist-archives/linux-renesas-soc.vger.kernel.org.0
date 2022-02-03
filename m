Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45F2D4A8BED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Feb 2022 19:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353577AbiBCSwz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Feb 2022 13:52:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353537AbiBCSwz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 13:52:55 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5CDC061714;
        Thu,  3 Feb 2022 10:52:55 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id a28so7902298lfl.7;
        Thu, 03 Feb 2022 10:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wg07Scu6KcH/ZI0H4YDzqY50t4Pcc+hbZYceQnxCNFg=;
        b=NrS+danQmo5DN6nn5IGb27J3Zz7vyv8Tan4CyRYHE21xF56qEtb1HBG47DWPG4eQHF
         JFCjrAHsOql1rQhmZvAO5Pj7ou6Anb1iXsHWBMbewv1rfDbuISSpTyJm1+Y3uVj2RRfV
         O10iJIp/tZJnxI5x/HcphOecGYBh8TrJ3U2ood1GKKLmGs19MtOn39ZOsYAworTkQEFi
         BSOwj0LibkIEteHuxOjDfNc2DvAS7mHrpQz89AzMj164UOP8lx3obPFSKoOXjwSxUecw
         EISwDOeeeY9JqTMTjlpcjvuQ9Lw7wjDe9tXjWSYnFVOyz6ev6hH6GBtTfOcb5cVdE+zJ
         WCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wg07Scu6KcH/ZI0H4YDzqY50t4Pcc+hbZYceQnxCNFg=;
        b=2J0MC2zBPmnxIJnP2MNQCPvbZMLsalKbhGCgvSubySi2G4+/SA1hHI8L6JxIMu3+Ox
         lcSaS3+GM/Uq3Wc+epBq9F9Bq9UEd65FdKfW3oOb+EhUXBp2Y5FEEn/o8C3y6+BRXC4X
         Km/iUX89z6Aw5v8jFe/hriBnisRAJVNj9SmM5Tiig0/T3hVAVvj1QccoLTkBhV/N5mzS
         peNnCD5P67NtBolBueOvxweCztGTmFbwsj6rrDjIaD5S1o2xKsdA8NhveuudFS7LXY3K
         2dWIzZ14iHjjIvhCELHrR4wS8U24JnNFRYN4lQCcW77fYvm7/pzpEScVuMCQiI9JkpbT
         uACw==
X-Gm-Message-State: AOAM533F/h+kg6GRXkp/WG9289GP25wejoUR6lwinOiQmk/XITiN7GK6
        oZs+jBPXyJHCvrCK78ZszUq3yzmnrr4=
X-Google-Smtp-Source: ABdhPJxYfKKG4t0vZjcd3HA0frM749AdiVA+XTgMLnl3gZBWwqGyxrZIAa1JMKcfeW/DSr6j5uYtjQ==
X-Received: by 2002:ac2:514b:: with SMTP id q11mr26771394lfd.403.1643914371610;
        Thu, 03 Feb 2022 10:52:51 -0800 (PST)
Received: from [192.168.1.103] ([31.173.83.202])
        by smtp.gmail.com with ESMTPSA id z19sm5041021lfg.126.2022.02.03.10.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 10:52:51 -0800 (PST)
Subject: Re: [PATCH resend] dt-bindings: ata: renesas,rcar-sata: Add r8a774e1
 support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <507cc45f44603afa6a70c05a3956fb7b13b49ed9.1643896347.git.geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <99ac1fc9-fa12-325c-3b54-eb3cb996a5df@gmail.com>
Date:   Thu, 3 Feb 2022 21:52:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <507cc45f44603afa6a70c05a3956fb7b13b49ed9.1643896347.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/3/22 4:58 PM, Geert Uytterhoeven wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document SATA support for the RZ/G2H SoC, no driver change required.

   I don't have the RZ/G2H manual, is it available online somewhere?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

   I guess I'll have to trust you there...

[...]

MBR, Sergey
