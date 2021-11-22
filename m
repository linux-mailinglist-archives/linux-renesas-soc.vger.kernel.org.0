Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED26458BE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 10:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239246AbhKVJ6R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 04:58:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37180
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239228AbhKVJ6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:58:14 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CE59D40018
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637574907;
        bh=zkumlnqNJKT+369TWNq+acNCTy9XczjMoYz/4LoM5wQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=hJh6exXTW04hkF6rrUALP8l/E5YJpvNlDt9827NiTi9aob1pB//n3JU9w/NMVA3DH
         DhkQvh5heeyWQbV0M7jd+JCDD8/MVERGFRslOQPMgCB+iE1r/NkPS8K9nx98WqwHmF
         sv+VrkhhK3fpTv8TaPKnHvgolM1q4chNq94CLONdd5I96hPIsUTBVGfJexjWuWZJOY
         35kmRv/YoFa+JB3keUkHr5NvV2STFnLuTA3j363+UB2b2s4GRHCWCvMuPneTjZaMtw
         l2BMnzS4isdyQ595DpLfHeSe0QgvuUePVBLrIy24OY0CxlRfVrJN+FNYl8Ob9M6Arm
         5rk5Oc0SMBuHQ==
Received: by mail-lf1-f70.google.com with SMTP id z1-20020a056512308100b003ff78e6402bso11746821lfd.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 01:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkumlnqNJKT+369TWNq+acNCTy9XczjMoYz/4LoM5wQ=;
        b=DDYqw5bhvMV3AmoLgNZksEW11XYfEHuzOwpRsFL2DcHCdHmaMvZuK1coj7eYTaNRQ1
         wfAriyLUwakJgX6qZX2+U3UHo/wbwfyTZG6TSdMsAiawDpdSl6RXW69G0/zTja/m7WQC
         7u3WPd2GC5PGNbrJqkVMAGNXblc0VQO9tgbas6C6q2RshWjfMJO1BeGxV/l10GBu8OpP
         alxCfzC8nd/iCuUF/REJYUmnJKfhwkwJcGTGwoZ61Rzi8REtSIINPSt5q3GUSnMvwGP4
         6AAqif953VX1QatqnQVf7pWgKMg1lnVCc1KYoS3/M9r/eKokx/Hkfz3zkti/C9Fupz1I
         V/2w==
X-Gm-Message-State: AOAM531F9CSdPHu8CHJ24YxHotZd0GGkE8BSN1tNuBcr8OPlmmK0qFCg
        8qvBI+vapMEKAI1duU3eE9UEGR/7xeFT8msdU7v9xnbnrzwbKs8Elpwgt1apeaHoI3jmYwDBnXP
        QYFtQtD5ILOEp5kQ5aNDqMezq9Bzg8mca6up7vURLeG/I3Mhs
X-Received: by 2002:a2e:9c02:: with SMTP id s2mr52044274lji.113.1637574906970;
        Mon, 22 Nov 2021 01:55:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdZHUyb3MDiG9TVAk44Ju/7cV1jt2q+jUzZuW6+cjZZY4uDIrKQ49ChR0NJyzshzLK/SZd4Q==
X-Received: by 2002:a2e:9c02:: with SMTP id s2mr52044244lji.113.1637574906753;
        Mon, 22 Nov 2021 01:55:06 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u22sm908676lff.118.2021.11.22.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 01:55:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] memory: renesas-rpc-if: simplify register update
Date:   Mon, 22 Nov 2021 10:54:25 +0100
Message-Id: <163757486271.327364.11884683801809986745.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211117102902.20062-1-wsa+renesas@sang-engineering.com>
References: <20211117102902.20062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 17 Nov 2021 11:29:02 +0100, Wolfram Sang wrote:
> No need to open code regmap_update_bits().
> 
> 

Applied, thanks!

[1/1] memory: renesas-rpc-if: simplify register update
      commit: 2db468d6fda4c33d26ba9dde7c72e081b2b86ad1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
