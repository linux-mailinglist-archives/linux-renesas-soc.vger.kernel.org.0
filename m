Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADD8458BDB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 10:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239210AbhKVJ6O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 04:58:14 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47780
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239227AbhKVJ6K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:58:10 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 635E13F175
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637574903;
        bh=XbrI8v5SiK/lQTgcd9wq3mq2WEL9a4Q5EFr23Q5MMJw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=dZLy8DdZnNife9klg87unVGKzWJIoRfQB0NaqTHY7sqdB5jj7nNCFS7sTrYvM/kOC
         CGZhJUKDX5yoSJmk9wbomT4Dzof16bTD63LsH2zGEzMXaUAqWyfeAcw2wQAaxDPrwz
         pvPSDb/qmeZ3Sln/kepduX7NQ85DaVYeRjOr/szTNbZT+epUT++fHoYQEhnLVnTvcg
         auseX4tQhYUoBBRsDMljs2/41py2MwCOGvsm2d7rJJO9Ou8Z3OjCf7DPxSjFyCXeET
         cdiDtO/GsuVX3ITCFOGf30xfyR4XdD6IcMQYQMwvuwhYdmfM+S9o09YTwqL7y9X7GX
         xn8OHa0G1T93Q==
Received: by mail-lf1-f69.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso11816535lfv.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 01:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XbrI8v5SiK/lQTgcd9wq3mq2WEL9a4Q5EFr23Q5MMJw=;
        b=yy84/cERgx+7NZNR1yTlB73TsC6EUy0Ba/IG3Tmw60/wfoOBnEFoZyQ0tOVRuVdXMW
         6N2YsDHgL2/qAPTiV+wZZPubuDNGsPEBPFfiSrlf4vN0No9v9ktnGCXd0DDjA/Io1WvJ
         NOSenbzvaXkigOyWgNTLThQS2OQF6FkieQvIKqYp7zh3Uaj460t+7HLl0kXFJmCfk/EC
         OveUvdL1fdG175mATVeT2sdYqrb3DGLFw/SJQZeBQX+keCgPC7jB+O2xi+VJXb7lXzB4
         5RVrY9HGIJhjWCmtmfdA7lZrHmtDrOdop575tn7L8HffzbVxM/6o/tA5PVmhi89czsmN
         S0MA==
X-Gm-Message-State: AOAM533iX/wTqG7e6VGOOHDxvRGjDmVRtZa8T7QFjIthEH4GharTpbkO
        /8lDwdru8d0mh0UyI2PoD7LBRy9IetksAMRbDUsbEAsMhYY9hBPflPoXkD4U6IaTKyWtjyziC2Z
        R9LM/GrhwOk2xJtiHo8c8iM4BkCyK5/Q1EE9NwDtIPfOTQCUO
X-Received: by 2002:a2e:9d05:: with SMTP id t5mr50466602lji.192.1637574902745;
        Mon, 22 Nov 2021 01:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwke2myThe8Gt/0eU50mIFwZeGa186M95bQ6FjvfYp1F25HVbkpTO5cJFBtu8Cq5yDswcSrbw==
X-Received: by 2002:a2e:9d05:: with SMTP id t5mr50466583lji.192.1637574902588;
        Mon, 22 Nov 2021 01:55:02 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u22sm908676lff.118.2021.11.22.01.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 01:55:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Silence clang warning
Date:   Mon, 22 Nov 2021 10:54:22 +0100
Message-Id: <163757486271.327364.15013387046506082286.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 21 Nov 2021 18:01:55 +0000, Lad Prabhakar wrote:
> This patch silences the following clang warning:
> 
> | drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
> | type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] memory: renesas-rpc-if: Silence clang warning
      commit: 2602dc10f9d930bcc537467d13de4cfbfaa2126d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
