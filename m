Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86642863CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Oct 2020 18:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgJGQYE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Oct 2020 12:24:04 -0400
Received: from sonic306-2.consmr.mail.bf2.yahoo.com ([74.6.132.41]:45849 "EHLO
        sonic306-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727379AbgJGQYD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 12:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602087842; bh=PxMwWzXvs+dqOoH0/FHvFmQpYH2JguaCUHYAVLLmaiw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=eiQQQuX/rrX6ZT9/VRDEmAoRMkZXXCn6genpAmf164q1fe7kzwgBfiEbjDYZRSjDvLljqQotAWdAumCOdex/jPpXW3QjxwBVjGGDA8gpmYVY8qEewYDxJDLosv28CQHlPzlcchtrCXgRFhUREoZuJaXQncoiETAQ2Pn3OGYAFp8hXe2vkCsj9hAc7zhUf7OsqodtaEk0oEgeO0Gi+ZN+361hzZncSxyto7LnL2RdGyfyKVgL3BP+04teN4WUqbDOo0px0JkO02yaEQsjAGDM23I47kZ3pu31FMd8FA/3nDpGYSR49a7hwsOAECteb6924pu6Mn6RoLkVlPJofQ+ufg==
X-YMail-OSG: feUT5fcVM1m0XnIR9bcE27UXJ4pCR9Pr2V4Ie69qDymM.Er0hLPI8IkfFraGwy6
 0PwjrcxWldQ9kuQOXZM0T1mUz_gsmBqvOCHBvkfd3J66H11XZXK5_r1knDi6LMpR8C3SiPyq5iD7
 tUk_Msr_qMIUnD4orO0n_o9PWYaVxob6exox9E_b1KGkpOMfO96KlMbcaIuAvqXD3ZA3vUfgCqNZ
 6DwTEXsiV4usLXRfE.p6ZbvCCRHcsK1rtXJHSiinCrWHbN8sJwN7O6VU1rEmkJ_tfDQllwVhTnJm
 l1n5VoF5YMDfT2hN.GlYkITJd4lUgHAPufybo.8bURoTdjRYjlEjddd5ng.YoQ0Rh0mTCHPtoypw
 gO3oCNpIXMMsqxbidSa182JtsTUrd._WgIVWduQaiAMf_0ITGsEDCz7Ecy8lsadHMt_PNaIOpKHA
 _lZJnlk.zTF6_SJX3rFF9uKEU.7mgiw7ctDd27W634YubQ1sLA6mgSvLVGWDbSl7JhpS4McnTRrm
 8wsdyDmRDgpp9BVMMYI0VnT.pM3U7giJjOVkbXVIH9yGGiP6MqpszP.5znSC_fFwBTKFn0ZIgm9E
 uhXeRHvdXSv6ve61rqMrohth998WocPAmhg9VcmZe.jjQOSX_cDaoYThUJcQO6Kgo1tNOZXcjs21
 Kgs.FmG5dFQ1xUG6UuKTRBzLDX4MYsrqN6sFtJrcwsyl1MVTyv.RkRZsOCoR.qr8hdfiuZa_7Nsw
 S.K8nzay2UnN_uVMRR4GDpyidTY6bMtntLjweVPIMkvMsgyziTUGKgWSYtPlnyLZY3E2J4H6SswC
 1TxskJsMxApaEuoHbajd.9u6wAWPesYZRakD0iVQG4Z6Kx4IcOlQLTmMla49biKQndKj4ctBWOTt
 1Isi1TxGFgUPRs4NThgQ6qcdELCJ5KyyU9u9FjRHERP5a4kB76LpwuI55aojJPHk4RsSnSzTrnXR
 wg4BcWzA9XY6Wad9Viy4OEXzfjZf8trhF7XvcWdN8G5ucrlundnNX6fi9gtJrqHP21acnNR718xx
 cW1R8qGIlgc5.4HdEtPb1RuYQ4dm4PLZRPnDbGCyB9CZCL_6ABqvwhBZXurL.yKhGpScu24_DijZ
 kYNLRzpXK8IoF3FJYpVP0mZAABzptNmNhUZDv.URF73k4aW1rICtChVJztbry9I_JN93mC3IGnqZ
 6FmL8z6IlWbAPCZ2YNBAX0xsmIWLaV1EDzn7nXHjSoBP0Fx2mmUwrMC9Zrq6MbVk.f6EIkcI5vdq
 PUbx4c0k1.ZajDye8Km3LQtpz7IDPuzcAqTDWamXp_q8zsky6ZCffV0vJfCR78CTANfxE58u8hro
 XxUkFBuzta92kjdgDPE8VnPm9Z38AjfhyEWSQsqXdH5ZYmkiQrcC3_ktVaYovf8SbMHdv27Gb1K9
 PzZPkdRdlx0g09pmNBWRYkETElMq_OXcu4.f9PQ8G
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Wed, 7 Oct 2020 16:24:02 +0000
Date:   Wed, 7 Oct 2020 16:23:57 +0000 (UTC)
From:   Marilyn Robert <fredodinga22@gmail.com>
Reply-To: marilyobert@gmail.com
Message-ID: <1873493109.151916.1602087837662@mail.yahoo.com>
Subject: =?UTF-8?B?0J3QsNGY0LzQuNC70LAg0LrQsNGYINCz0L7RgdC/0L7QtNCw0YDQvtGC?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
References: <1873493109.151916.1602087837662.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCtCd0LDRmNC80LjQu9CwINC60LDRmCDQs9C+0YHQv9C+0LTQsNGA0L7Rgg0KDQrQiNCw0YEg
0YHRg9C8IDY4LdCz0L7QtNC40YjQvdCwINC20LXQvdCwLCDQutC+0ZjQsCDRgdGC0YDQsNC00LAg
0L7QtCDQv9GA0L7QtNC+0LvQttC10L0g0LrQsNGA0YbQuNC90L7QvCDQvdCwINC00L7RmNC60LAs
INC+0LQg0YHQuNGC0LUg0LzQtdC00LjRhtC40L3RgdC60Lgg0LjQvdC00LjQutCw0YbQuNC4LCDQ
vNC+0ZjQsNGC0LAg0YHQvtGB0YLQvtGY0LHQsCDQvdCw0LLQuNGB0YLQuNC90LAg0YHQtSDQstC7
0L7RiNC4INC4INC+0YfQuNCz0LvQtdC00L3QviDQtSDQtNC10LrQsCDQvNC+0LbQtdCx0Lgg0L3Q
tdC80LAg0LTQsCDQttC40LLQtdCw0Lwg0L/QvtCy0LXRnNC1INC+0LQg0YjQtdGB0YIg0LzQtdGB
0LXRhtC4INC60LDQutC+INGA0LXQt9GD0LvRgtCw0YIg0L3QsCDQsdGA0LfQuNC+0YIg0YDQsNGB
0YIg0Lgg0LHQvtC70LrQsNGC0LAg0YjRgtC+INGB0LUg0ZjQsNCy0YPQstCwINC60LDRmCDQvdC1
0LAuINCc0L7RmNC+0YIg0YHQvtC/0YDRg9CzINC/0L7Rh9C40L3QsCDQvdC10LrQvtC70LrRgyDQ
s9C+0LTQuNC90Lgg0L3QsNC90LDQt9Cw0LQg0Lgg0L3QsNGI0LjRgtC1INC00L7Qu9Cz0Lgg0LPQ
vtC00LjQvdC4INCx0YDQsNC6INC90LUg0LHQtdCwINCx0LvQsNCz0L7RgdC70L7QstC10L3QuCDR
gdC+INC90LjRgtGDINC10LTQvdC+INC00LXRgtC1LCDQv9C+INC90LXQs9C+0LLQsNGC0LAg0YHQ
vNGA0YIg0LPQviDQvdCw0YHQu9C10LTQuNCyINGG0LXQu9C+0YLQviDQvdC10LPQvtCy0L4g0LHQ
vtCz0LDRgtGB0YLQstC+Lg0KDQrQlNC+0LDRk9Cw0Lwg0LrQsNGYINCy0LDRgSDQvtGC0LrQsNC6
0L4g0YHQtSDQv9C+0LzQvtC70LjQsiDQt9CwINGC0L7QsCwg0L/QvtC00LPQvtGC0LLQtdC9INGB
0YPQvCDQtNCwINC00L7QvdC40YDQsNC8INGB0YPQvNCwINC+0LQgMiwgMzAwLCAwMDAg0LXQstGA
0LAg0LfQsCDQv9C+0LzQvtGIINC90LAg0YHQuNGA0L7QvNCw0YjQvdC40YLQtSwg0YHQuNGA0L7Q
vNCw0YjQvdC40YLQtSDQuCDQv9C+0LzQsNC70LrRgyDQv9GA0LjQstC40LvQtdCz0LjRgNCw0L3Q
uNGC0LUg0LzQtdGT0YMg0LLQsNGI0LjRgtC1INGB0L7QsdGA0LDQvdC40ZjQsCAvINC+0L/RiNGC
0LXRgdGC0LLQvi4g0JfQsNCx0LXQu9C10LbQtdGC0LUg0LTQtdC60LAg0L7QstC+0Zgg0YTQvtC9
0LQg0LUg0LTQtdC/0L7QvdC40YDQsNC9INCy0L4g0LHQsNC90LrQsCDQutCw0LTQtSDRiNGC0L4g
0YDQsNCx0L7RgtC10YjQtSDQvNC+0ZjQvtGCINGB0L7Qv9GA0YPQsy4gQXBwcmVjaWF0ZdC1INGG
0LXQvdCw0Lwg0LDQutC+INC+0LHRgNC90LXRgtC1INCy0L3QuNC80LDQvdC40LUg0L3QsCDQvNC+
0LXRgtC+INCx0LDRgNCw0ZrQtSDQt9CwINC/0YDQvtC/0LDQs9C40YDQsNGa0LUg0L3QsCDQvNCw
0YHQsNC20LDRgtCwINC90LAg0LrRgNCw0LvRgdGC0LLQvtGC0L4sINGc0LUg0LLQuCDQtNCw0LTQ
sNC8INC/0L7QstC10ZzQtSDQtNC10YLQsNC70Lgg0LfQsCDRgtC+0LAg0LrQsNC60L4g0LTQsCDQ
v9C+0YHRgtCw0L/QuNGC0LUuDQoNCtCR0LvQsNCz0L7QtNCw0YDQsNC8DQrQky3Rk9CwINCc0LXR
gNC40LvQuNC9INCg0L7QsdC10YDRgg==
