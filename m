Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83ADC10E308
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Dec 2019 19:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfLASVD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 Dec 2019 13:21:03 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:9691 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727252AbfLASVD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Dec 2019 13:21:03 -0500
X-Greylist: delayed 6625 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:21:02 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217635; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=qW2HUTDIZNTiprJfk2Ku1KOZlH1W6S32MZUjhgu4wqau
        DrN5X0tW1icPk5WB2nxBOUPmHXZxQTi+MMgLFwKLY84ifrJKMe
        j98uwVTuk6DCOrm1y8ejJErPkPyBDWWSKXSAT1603ynvMZQWXQ
        LX1u6Y8Kpelrf6Dy8POdADyFpqg=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 1dee_6536_1fd5ef8a_3a67_483a_881b_15e46b14d77c;
        Sun, 01 Dec 2019 10:27:14 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 4C0AF1E2666;
        Sun,  1 Dec 2019 10:18:50 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ygQOUU0MRigH; Sun,  1 Dec 2019 10:18:50 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 49AFC1E2FA3;
        Sun,  1 Dec 2019 10:14:15 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 49AFC1E2FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216855;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=gXbuT88L0tGEOm6HjwRNbRfg+0CI9fM03yJ/MpKnDohPK/9sfreqEKB96967x56BU
         rvdVswRpJ0r21lgHKdEjaPr6t4lRE2kB1hJfeC9qmUoKqJRlDhxXtGq8JLX4/x90pn
         07/fZnhdyJARI5oWxMqaO2ok+OK+kel8RCnpIc/U=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Uj8oIbzoDBqT; Sun,  1 Dec 2019 10:14:15 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id 2B27C1E2DFF;
        Sun,  1 Dec 2019 10:05:06 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:05:00 +0100
Message-Id: <20191201160507.2B27C1E2DFF@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=Ibr3YSia c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: 0e9e3ed5.0.48578459.00-2377.81665046.s12p02m013.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949750>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
