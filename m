Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54E5693E3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 07:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjBMG0M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 01:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjBMG0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 01:26:07 -0500
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFFD113EA;
        Sun, 12 Feb 2023 22:26:05 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id hx15so29196335ejc.11;
        Sun, 12 Feb 2023 22:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8bSef3f3mOz3iIyKwv0HKPMk5PyTqQzC7Ssvv0UywA=;
        b=yT4TANSzZULknzdwsFT2J9ZXg2S+gZPXctfMwikG7BENZ9Qsn2yJNwbMARwu4WDnrZ
         CMNLdvr/0X8G/3XDKP0zKC/G8hXrnWG3RaDHSQ0vAA4v1dYaLNlbNZfGeP8X+QquQKk1
         iojcEQNNTwXkvTpEoFC/sWzsCCcOgJbwnzJg8sknwnyjCYQ/2F1WUnT4Bbh22SfLYjoZ
         njY+UBrXbhgMXqT7zrIeAbkZJcygIHjNRaqQqNZ53O6DPTsGn3G4rpGalcEZYkmi5o2j
         Xg7TEoVmV/KPKfO2NWEiLWWVEJIHmeso1jFtQHK0WuUlT+/ZsZpXCl8Ohaafyk2/VS3w
         bUlg==
X-Gm-Message-State: AO0yUKWt53vnad2EtH1K5qCFpsikdfGMuLGZ9chESENBKM7Qtyos2w7b
        D8auTUnNoTI3t5JV+I+R7EI=
X-Google-Smtp-Source: AK7set/RZBUhMJGY6F05K3BHL48EGCcrFQSlZP0xmyOV9wRHJ3ZmQydnCTIgEyDZHqpHbIHyv1MWTA==
X-Received: by 2002:a17:907:9c0a:b0:8a9:e031:c49b with SMTP id ld10-20020a1709079c0a00b008a9e031c49bmr23686326ejc.4.1676269564442;
        Sun, 12 Feb 2023 22:26:04 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id gs4-20020a170906f18400b008a5cbd8f7d1sm6281758ejb.127.2023.02.12.22.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 22:26:04 -0800 (PST)
Message-ID: <af36a245-a73e-0f58-9c15-8435f542c4a1@kernel.org>
Date:   Mon, 13 Feb 2023 07:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-3-biju.das.jz@bp.renesas.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230210203439.174913-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10. 02. 23, 21:34, Biju Das wrote:
> The UART IP found on RZ/V2M SoC is Register-compatible with the
> general-purpose 16750 UART chip. This patch updates RZ/V2M
> port type from 16550A->16750 and also enables 64-bytes fifo support.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

-- 
js
suse labs

