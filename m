Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B143D458BDE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 10:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239249AbhKVJ6P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 04:58:15 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37164
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239261AbhKVJ6N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:58:13 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9BCA940019
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637574906;
        bh=dB2Lntj22dWqXlkeKbseUbDWYiS3+mH3WlSs6SjDjBE=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=lmzhw5dOc8vOoBa5ro0+vy6Sq/eFxrD64k2+27ZZaVKJnQwjxHLLO+1XOS7vum/oQ
         ba9DPr7KDmnYZdQzII+hAVLwLNRWQpY2I2oJiisfm75bjWS/YhXIC+X9CGzzePh9TI
         JdWOeizAm5F820q5Bfk26SF+M8cfu+6XRvAN3phL21MCvWqA74rncQ953XspYq8Lwm
         b5vq5ti2oqpbhvw26weX5/lfFU9Z0zYwO6sQJEefNXgiYfos043CH3dI+2zU1GNd+k
         RO6bzByA5pEDo9PKDlFYQhB37oRQlXNzcDs5lpqIIibI5KA86ApviFC8gYeKcMpp4p
         tejSzpCXeziqQ==
Received: by mail-lf1-f70.google.com with SMTP id s18-20020ac25c52000000b004016bab6a12so11814892lfp.21
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 01:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dB2Lntj22dWqXlkeKbseUbDWYiS3+mH3WlSs6SjDjBE=;
        b=Sm004+V0hyha6/mSUMy7SMgcyTp2iZKupp8w5nuhFyCsIQT+dC1wdwkPBNSLImlE3z
         Uv1724novXTlxzKphSWdZHDCE8PbfxeXBbXB1ORiY+tsUU2VpI2INeow5dl0ze0pa1rg
         gRTQ+3PW/WA0yNVeAg1qFLet6r0GiuoRQaoUvTGSAsIy2MhOCzT3AiCLVZk70sV2346G
         PQMtlx/721rw2bWz+e/vUld6ECEaMsJt4w48laLN6HV0N2FCjEK6g3gSt/UrPyc0ynyA
         t920NjNkG/TV2UC1u48kV6yiYDRTJjpG8UcAkAsi+OBaVUUzqAppupDFLgqOIagiNvuF
         BTSw==
X-Gm-Message-State: AOAM531Kx4kZy17HfoHFEGRYkyQC2NxiPOz0YEututVdaPbhImeY4NJe
        AirUQc0fE5thzirITSDM3KFXZLGvXwyP8o4IvLmWVP0D0Vk8dpQvpYS54Dfh6swWmwX/qlbv61b
        Q6tAvQdoEjGWJiMjVnzAgQKoawTROhJ44F3Ob9QIglo4Xjh4l
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr56260152lfc.158.1637574905479;
        Mon, 22 Nov 2021 01:55:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9PPFmOJ68zZGjTnhCkl6/sftwHSX1Hhvq89gHSbgzkV+wW2bmqJXFR51GWBUQPfE4nV06Uw==
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr56260138lfc.158.1637574905329;
        Mon, 22 Nov 2021 01:55:05 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u22sm908676lff.118.2021.11.22.01.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 01:55:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: refactor MOIIO and IOFV macros
Date:   Mon, 22 Nov 2021 10:54:24 +0100
Message-Id: <163757486271.327364.12120289084289830321.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119110442.4946-1-wsa+renesas@sang-engineering.com>
References: <20211119110442.4946-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 19 Nov 2021 12:04:42 +0100, Wolfram Sang wrote:
> Don't use _HIZ macros but also provide a val. This is more consistent
> with the other macros and, thus, easier to read. Also shorter.
> 
> 

Applied, thanks!

[1/1] memory: renesas-rpc-if: refactor MOIIO and IOFV macros
      commit: 3542de6a5b159fac0e7ca84d77a57ea99125d6b1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
