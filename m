Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E53614CAE8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Mar 2022 20:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbiCBTXV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Mar 2022 14:23:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbiCBTXT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 14:23:19 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8EB2BCC;
        Wed,  2 Mar 2022 11:22:36 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id em10-20020a17090b014a00b001bc3071f921so5644113pjb.5;
        Wed, 02 Mar 2022 11:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e4GTR8GaUHYkyzZntKtPvMACHaO+jIs3XNbO6sJQm48=;
        b=h5rBD0THGtQxl3P8+fdalmIEcRsx/fi77wxgGlwZxzhpp85g6zGKMvnReB2R/0KApi
         l1aI3C88GAiJqiCsBkG+ZtAuBdx0tt3VqJZjygi/VkVAfKV0j08DA961K7c3CQRPe5Tl
         KMk+4JySvAq5V+LO8jhFzy5phCBnwDWOwxWAIMqqGRM3FNr1nfzEUZ8hoI+NPr2x7rXO
         78GtcdFyOcVD2XEJL0R5aCV/6983WJF18lX1v0oL0PCGhVIxMMycjQA+DHAjbvXwbPnD
         Nm412ij1baoGvURNcQkhu0qHGAA9unCxHIk9AK0A3sAzyeol1LFFTA4wT4nQU5G62+X5
         X/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e4GTR8GaUHYkyzZntKtPvMACHaO+jIs3XNbO6sJQm48=;
        b=BIlDnYziS7CsPwGrGzjFw1871uhEsorYq2mhruerrYVEjXnEtcVnvbuDDhtqCArfC7
         tMGDTvBCgG/oE3DXBaVV7412rQZBXia0SVb+YX5/PMJipRSBX/qImlov6gHXHwChVXgr
         UBAZJet6fip7UR2PHn/qOWhAFafbMhUdhh+7YgEk3Y67ytDvWtz0W4ZqJIQJZ81jHC57
         ELPN5GgVi6gU36S5AiLAWBh1DwbUSFwG1HVZURTTX6TykccOBgoHnGHxIHF7BJmMkxC+
         8Om6IVTyPql4LAovFwhElQOqGT0vdOFgvzX+LZQLjXFmfAPIdJJd/SllFs2OlIdzaXDf
         sMig==
X-Gm-Message-State: AOAM532QC0BIqmEcXrOeyNlKn8YJuW/VkcBzjoXBSjWhZG/JHpkiGoWX
        pGDho35mdUkNDhyZM6LnpUY=
X-Google-Smtp-Source: ABdhPJya2BuKC74VQ9qxushY+WD8JX8/Ndgb9h19iixfLdlcy5xscoib53+wVHcJeAnpY31fdMwQ2w==
X-Received: by 2002:a17:90b:f87:b0:1bc:b82b:69fc with SMTP id ft7-20020a17090b0f8700b001bcb82b69fcmr1357002pjb.236.1646248955678;
        Wed, 02 Mar 2022 11:22:35 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id 142-20020a621894000000b004dfc714b076sm22597207pfy.11.2022.03.02.11.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 11:22:35 -0800 (PST)
Message-ID: <f3320bb8-b7eb-95d8-2f8d-9821dcecc198@gmail.com>
Date:   Wed, 2 Mar 2022 11:22:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] ata: Drop commas after OF match table sentinels
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <15d4b8e1108c902c4e80c87edfc702a7786de4ba.1646209667.git.geert+renesas@glider.be>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <15d4b8e1108c902c4e80c87edfc702a7786de4ba.1646209667.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 3/2/2022 12:30 AM, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> Add comments to clarify the purpose of the empty elements.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

For:
> ---
>   drivers/ata/ahci_brcm.c        | 2 +-
-- 
Florian
